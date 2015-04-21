defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    case rem(n, 3) do
      0 ->
        case rem(n, 5) do 
          0 -> "FizzBuzz"
          _ -> "Fizz"
        end
      _ -> 
        case rem(n, 5) do
          0 -> "Buzz"
          _ -> n
        end
    end
  end
end
