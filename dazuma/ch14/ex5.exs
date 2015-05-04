defmodule ExitBehavior do

  def worker(dest) do
    send(dest, :hello)
    raise "Exception"
  end

  def receive_all do
    receive do
      term -> 
        IO.puts("RECEIVED: #{inspect(term)}")
        receive_all
    after 1000 ->
      IO.puts("NO MORE MESSAGES")
    end
  end

  def run do
    spawn_monitor(ExitBehavior, :worker, [self])
    :timer.sleep(500)
    receive_all
  end

end


ExitBehavior.run
