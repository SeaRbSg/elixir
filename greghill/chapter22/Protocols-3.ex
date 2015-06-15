
defmodule Enummy do
  def each(collection, fun) do
    Enum.reduce(collection,0, fn(x, _acc) -> fun.(x) end)
  end

  def filter(collection, fun) do
    filterfunc = fn (x, acc) ->
      if fun.(x) do
        [x | acc ]
      else
        acc
      end
    end
    Enum.reduce(collection,[],filterfunc) |> Enum.reverse
  end

  def map(collection, fun) do 
    Enum.reduce(collection,[], fn x, acc -> [ fun.(x) | acc] end) |> Enum.reverse
  end

end

# Enummy.each([5, 4, 3, 2, 1], fn x -> IO.puts "Element: #{x}" end)
# Element: 5
# Element: 4
# Element: 3
# Element: 2
# Element: 1
# :ok

# Enummy.filter([6, 5, 4, 3, 2, 1], fn x -> x > 3 end)
# [6, 5, 4]

# Enummy.map([4,3,2,1], fn x -> x * 2 end )
# [2, 4, 6, 8]
