# Strangely, this appears to be deterministic in practice
# It definitely *shouldn't* be, in theory

# How make deterministic? Easiest way IMHO is to include the PID
# in the receive block, like so:

# in echo, replace the send line with "send pid, {self, token}"

# in q2, replace the first receive with {t, token} and the second
# with {r, token}

# q6: Because self called within the context of a fn passed to spawn
#     returns the CHILD process's self. It's like var self=this in js


defmodule Ch14 do
  def q2 do
    t = spawn(Ch14, :echo, [])
    r = spawn(Ch14, :echo, [])

    send t, {self, :transistor}
    send r, {self, :red       }

    receive do
      token ->
        IO.puts inspect(token)
    end

    receive do
      token ->
        IO.puts inspect(token)
    end
  end

  def echo do
    receive do
      {pid, token} ->
        send pid, token
    end
  end


  # LOLZ YOU DIDN'T TELL ME TO TRAP EXITS
  # Parent *immediately* receives :KAHBOOM and exits
  def q3 do
    spawn_link(Ch14, :q3_spawn, [self])
    :timer.sleep(500)
    q3_recloop
  end

  def q3_spawn(parent) do
    send parent, :swordfish
    exit(:KAHBOOM)
  end

  defp q3_recloop do
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        q3_recloop
      after 1000 ->
        IO.puts "Nothing beside remains."
    end
  end

  def q4 do
    spawn_link(Ch14, :q4_spawn, [self])
    :timer.sleep(500)
    q4_recloop
  end

  def q4_spawn(parent) do
    send parent, :swordfish
    throw :up
  end

  defp q4_recloop do
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
        q4_recloop
      after 1000 ->
        IO.puts "Nothing beside remains."
    end
  end

  def q5(:exit) do
    spawn_monitor(Ch14, :q3_spawn, [self])
    :timer.sleep(500)
    q3_recloop
  end

  def q5(:throw) do
    spawn_monitor(Ch14, :q4_spawn, [self])
    :timer.sleep(500)
    q4_recloop
  end

  def q7 do

  end

  def pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (send me, { self, fun.(elem) }) end
       end)
    |> Enum.map(fn (pid) ->
         receive do {^pid, result} -> result end
       end)
  end

  def broken_pmap(collection, fun) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn ->
           sleep(:random.uniform(500))
           (send me, { self, fun.(elem) }) 
         end
       end)
    |> Enum.map(fn (pid) ->
         receive do {_pid, result} -> result end
       end)
  end

  def sleep(msec) do
    receive do
      after msec -> nil end
    end
  end
