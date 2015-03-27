defmodule Ch7Ex0 do
  def sum([head]), do: head
  def sum([head | tail]), do: head + sum(tail)
end

IO.puts Ch7Ex0.sum([1,2,3,4,5])
