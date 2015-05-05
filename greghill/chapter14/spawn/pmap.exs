defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (send me, { self, fun.(elem) }) end
       end)
    |> Enum.map(fn (pid) ->
         receive do { ^pid, result } -> result end
       end)
  end
end


# How does the second enum work? Does it sit and wait for the corresponding result and pid?
# If so, what happens if the results come out of order? Where does a messsage sit while it's 
# waiting to be received?