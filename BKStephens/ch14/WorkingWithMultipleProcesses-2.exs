#Write a program that spawns two processes and then passes each a unique token (for example, "fred" and "betty").
#Have them send the tokens back.
# - Is the order in which the replies are received deterministic in theory? In practice?
# - If either answer is no, how could you make it so?

#This code is deterministic/we will always get the same result. I tried to see if we could get betty before fred by making mimic sleep for 1 second when "fred" is received as token. 

defmodule Processes do
  def run do
    spawn_and_send("fred")
    spawn_and_send("betty")
  end

  def spawn_and_send(token) do
    process = spawn(Processes, :mimic, [self])
    send process, token
    receive do
      response -> IO.puts inspect response
    end
  end

  def mimic(caller) do
    receive do
      token = "fred" -> 
        :timer.sleep(1000) 
        send caller, token
      token -> send caller, token
    end
  end
end
