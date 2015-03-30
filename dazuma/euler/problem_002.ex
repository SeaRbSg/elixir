defmodule Euler002 do

  def using_loop(max), do: _loop(max, 1, 2, 0)
  defp _loop(max, _prev, cur, sum) when cur > max, do: sum
  defp _loop(max, prev, cur, sum) do
    if rem(cur, 2) == 0, do: sum = sum + cur
    _loop(max, cur, prev + cur, sum)
  end

  def using_streams(max) do
    Stream.iterate({1, 1}, fn {prev, cur} -> {cur, prev + cur} end)
    |> Stream.map(&(elem(&1, 1)))
    |> Stream.filter(&(rem(&1, 2) == 0))
    |> Stream.take_while(&(&1 <= max))
    |> Enum.sum()
  end

end


Euler002.using_streams(4000000) |> IO.puts
