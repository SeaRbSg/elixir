defmodule Bitmap do
  defstruct value: 0
  
  defimpl Inspect, for: Bitmap do
    def inspect(value, _opts) do 
      "%Bitmap{value: #{ value |> to_string |> String.to_integer 2}}"
    end
  end

  defimpl String.Chars do
    def to_string(value), do: Enum.join(value, "")
  end

  defimpl Enumerable  do
    import :math, only: [log: 1]

    def reduce(bitmap, {:cont, acc}, fun) do
      bit_count =  Enum.count(bitmap)
      _reduce({bitmap, bit_count}, { :cont, acc }, fun)
    end

    defp _reduce({_bitmap, -1}, { :cont, acc }, _fun), do: { :done, acc }

    defp _reduce({bitmap, bit_number}, { :cont, acc }, fun) do
      _reduce({bitmap, bit_number-1}, fun.(bitmap[bit_number], acc), fun)
    end

    defp _reduce({_bitmap, _bit_number}, { :halt, acc }, _fun), do: { :halted, acc }

    defp _reduce({bitmap, bit_number}, { :suspend, acc }, fun), 
    do: { :suspended, acc, &_reduce({bitmap, bit_number}, &1, fun), fun } 

    def member?(value, bit_number) do
      { :ok, 0 <= bit_number && bit_number < Enum.count(value) }
    end

    def count(%Bitmap{value: value}) do              
      { :ok, trunc(log(abs(value))/log(2)) + 1 }
    end
  end

  defimpl Access do
    use Bitwise
    def get(%Bitmap{value: value}, bit) do
      if (value &&& ( 1 <<< bit )) == 0, do: 0, else: 1
    end

    def get_and_update(bitmap = %Bitmap{value: value}, bit, accessor_fn) do 
      old_value = get(bitmap, bit)
      new_value = accessor_fn.(old_value)
          value = (value &&& bnot(1 <<< bit)) ||| (new_value <<< bit)
      %Bitmap{value: value}
    end
  end
end
