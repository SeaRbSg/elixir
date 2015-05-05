defmodule Ticker do
  @interval 2000
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], []])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients, waiting_clients) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid|clients], waiting_clients)
    after
      @interval ->
        IO.puts "tick"
        waiting_clients = notify(clients, waiting_clients)
        generator(clients, waiting_clients)
    end
  end

  defp notify([], []), do: []
  defp notify(clients, []), do: notify(clients, clients)
  defp notify(_clients, [ next_client | waiting_clients]) do
    send next_client, { :tick }
    waiting_clients
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        receiver
    end
  end
end
