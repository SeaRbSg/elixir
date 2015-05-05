defmodule Processes do 
  import :timer, only: [ sleep: 1 ]

  def responder parent_pid do
    send parent_pid, "barney"

    exit :kaboom
  end

  def run do
    spawn_monitor(Processes, :responder, [ self ]) 

    receive do 
      msg -> IO.puts "Received message: #{IO.inspect msg}"
    end

    sleep 2000

  end
end

Processes.run


