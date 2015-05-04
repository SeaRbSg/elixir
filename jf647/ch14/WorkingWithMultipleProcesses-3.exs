defmodule Ch14Ex3 do
  def doit do
    receive do
      {sender, _} ->
        send sender, "about to exit"
        raise "Giving Up"
    end
  end
end

defmodule Receiver do
  def get do
    receive do
      msg -> IO.puts inspect(msg)
      get
    end
  end
end

import :timer, only: [ sleep: 1 ]

subproc = spawn_monitor(Ch14Ex3, :doit, [])
send subproc, {self, "foo"}
#Process.flag(:trap_exit, true)
sleep 500

Receiver.get
