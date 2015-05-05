defmodule Processes do 
  import :timer, only: [ sleep: 1 ]

  def responder parent_pid do
    send parent_pid, "barney"
    raise RuntimeError, message: "kaboommed"
  
  end

  def receive_messages do
    receive do 
      msg -> 
        IO.puts "The child sent: #{inspect msg}"
        receive_messages
      after 1000 ->
        IO.puts "And that was that......"
    end
  end
  def run do
    child = spawn_monitor(Processes, :responder, [ self ]) 
    IO.inspect child
    receive_messages
  end
end

Processes.run


