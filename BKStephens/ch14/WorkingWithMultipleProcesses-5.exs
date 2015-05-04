defmodule SpawnMonitorExit do
  def run do
    Process.flag(:trap_exit, true)
    _res = spawn_monitor(Spawn, :call_parent, [self])
    :timer.sleep(500)
    receive_messages
  end

  def call_parent(parent) do
    send parent, "Boom, headshot!"
    exit "bye" 
  end

  def receive_messages do
    receive do 
      msg -> IO.puts "#{inspect msg}"
      receive_messages 
    after 500 -> 
      IO.puts "timeout"
    end
  end
end

SpawnMonitorExit.run

defmodule SpawnMonitorException do
  def run do
    Process.flag(:trap_exit, true)
    _res = spawn_monitor(Spawn, :call_parent, [self])
    :timer.sleep(500)
    receive_messages
  end

  def call_parent(parent) do
    send parent, "Boom, headshot!"
    raise RuntimeError, message: "bye"
  end

  def receive_messages do
    receive do 
      msg -> IO.puts "#{inspect msg}"
      receive_messages 
    after 500 -> 
      IO.puts "timeout"
    end
  end
end

SpawnMonitorException.run
