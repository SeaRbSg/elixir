defmodule Processes do 

  def responder do
    receive do 
      {sender_pid, msg} ->
        send sender_pid, msg
    end
  end

  def spawner, do: spawn(Processes, :responder, []) 

end

process1 = Processes.spawner 
process2 = Processes.spawner
send process1, {self, "Barney"}
send process2, {self, "Fred"}

receive do 
  msg -> IO.puts msg
end

receive do
  msg -> IO.puts msg
end