defmodule RingClient do
  @interval 2000
  @name :ticker

  def start(master) do
    pid = spawn(__MODULE__, :receiver, [[]])
    if master do
      :global.register_name(@name, pid)
    end
    RingClient.register(pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def receiver([head | tail]) do
    receive do
      { :register, pid } ->
        IO.puts "adding client #{inspect pid}"
        receiver([head | tail] ++ [pid])
      { :tick, new_todo } ->
        IO.puts "tock in #{inspect self}"
        receiver(new_todo)
    after @interval ->
      IO.puts "tick to #{inspect head}"
      send head, { :tick, tail }
    end
  end
end
