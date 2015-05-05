defmodule Ticker do

  @interval 2000   # 2 seconds
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[],[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator([], []) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid], [pid])
    end
  end

  def generator([client|clients], []) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid | [client|clients]], [pid | clients])
    after
      @interval ->
        IO.puts "tick"
        send client, { :tick }
        generator([client|clients], clients)
    end
  end

  def generator(clients, [client|remaining]) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid | clients], [client | remaining])
    after
      @interval ->
        IO.puts "tick"
        send client, { :tick }
        generator(clients, remaining)
    end
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