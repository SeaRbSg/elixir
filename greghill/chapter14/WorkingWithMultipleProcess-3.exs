defmodule Processes do 
  import :timer, only: [ sleep: 1 ]

  def responder parent_pid do
    send parent_pid, "barney"
    sleep 500
    exit :kaboom
  end

  def run do
    spawn_link(Processes, :responder, [ self ]) 

    receive do 
      msg -> IO.puts msg
    end

    sleep 2000

  end
end

Processes.run

