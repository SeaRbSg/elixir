defmodule Ticker do

  @interval 2000 # 2 seconds
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], []])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(cur_clients, all_clients) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator(cur_clients, [pid|all_clients])
      after @interval ->
        IO.puts "tick"
        sender(cur_clients, all_clients)
    end
  end

  def sender([], []), do: generator([], [])
  def sender([], all_clients), do: sender(all_clients, all_clients)
  def sender([client | rest], all_clients) do
    send client, {:tick}
    generator(rest, all_clients)
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
        IO.puts "tock in client: #{inspect(self)}"
        receiver
    end
  end

end
