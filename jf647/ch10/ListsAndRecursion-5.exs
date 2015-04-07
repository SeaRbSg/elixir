defmodule Ch10Ex5 do
  def all?([], _), do: true
  def all?([head | tail], func) do
    func.(head) and all?(tail, func)
  end

  def each([], _), do: []
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
    :ok
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head] ++ filter(tail, func)
    else
      [] ++ filter(tail, func)
    end
  end

  def split([], _), do: []
  def split([head | tail], 0) do

  end
end

list = [1, 2, 3, 4, 5]

IO.puts "all?"
IO.puts Ch10Ex5.all?(list, &(&1 < 4))
IO.puts ""

IO.puts "each"
IO.puts Ch10Ex5.each(list, &(IO.puts &1 * 5))
IO.puts ""

IO.puts "filter"
IO.puts Enum.join(Ch10Ex5.filter(list, &(&1 < 4)), ", ")
IO.puts ""

IO.puts "split"
IO.puts Enum.join(Ch10Ex5.split(list, num)
IO.puts ""
