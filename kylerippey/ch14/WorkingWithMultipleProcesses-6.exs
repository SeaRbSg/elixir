defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection 
    |> Enum.map(fn (elem) ->
      spawn_link fn ->
        IO.puts "Self: #{inspect(self)}"
        IO.puts "Me: #{inspect(me)}"
        (send me, {self, fun.(elem)})
      end
    end)
    |> Enum.map(fn (pid) -> receive do { ^pid, result } -> result end end)
  end
end

Parallel.pmap 1.. 10, &(& 1 * &1)

# Because "self" inside of the method passed to spawn link refers to
# the new process and not the parent.