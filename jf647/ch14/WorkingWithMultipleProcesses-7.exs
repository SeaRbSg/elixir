defmodule Parallel do
  import :timer, only: [ sleep: 1 ]
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (sleep 100-elem; send me, { self, fun.(elem) }) end
      end)
    |> Enum.reverse
    |> Enum.map(fn (_) ->
         receive do { _, result } -> result end
      end)
  end
end

IO.puts inspect(Parallel.pmap 1..10, &(&1 * &1))
