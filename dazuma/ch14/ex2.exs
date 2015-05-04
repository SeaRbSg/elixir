defmodule SendBack do

  def worker(dest) do
    receive do
      token -> send(dest, token)
    end
  end

  def run do
    pid1 = spawn(SendBack, :worker, [self])
    pid2 = spawn(SendBack, :worker, [self])
    send(pid1, :fred)
    send(pid2, :betty)

    1..2 |> Enum.each(fn (_) ->
      receive do
        token -> IO.puts(token)
      end
    end)
  end

end


SendBack.run


# In theory, the order is nondeterministic.
# In practice, fred is usually returned first, but I have observed cases where
# betty is returned first.

# One way to make it deterministic is to serialize the operations: don't send
# the second message until the first response is received.
