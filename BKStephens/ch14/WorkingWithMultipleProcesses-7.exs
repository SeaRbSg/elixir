defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, { self, fun.(elem) }) end
      end)
    |> Enum.map(fn (pid) ->
        #receive do { ^pid, result } -> result end
        receive do { _pid, result } -> result end
      end)
  end

  def times(x) when x > 0 do
    IO.inspect Parallel.pmap 1..100, &(&1 * &1)
    times(x-1)
  end

  def times(_x) do
  end
end

#I can see the order not being enforced by running the function 10 times.
Parallel.times(10)
