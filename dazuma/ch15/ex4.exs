defmodule Ticker do

  @interval 2000 # 2 seconds
  @name :ticker

  def new_ring do
    spawn(__MODULE__, :run_ticker, [])
  end

  def attach_ring(member) do
    spawn(__MODULE__, :run_attach, [member])
  end

  def start do
    case :global.whereis_name(@name) do
      :undefined ->
        pid = new_ring
        :global.register_name(@name, pid)
        pid
      pid ->
        attach_ring(pid)
    end
  end

  def run_ticker, do: run_ticker(true, self)

  def run_ticker(active, next_member) do
    receive do
      {:attach, pid} ->
        IO.puts "attaching #{inspect pid} after #{inspect self}"
        send(pid, {:attach_ack, next_member})
        run_ticker(active, pid)
      {:tick} when not active ->
        IO.puts "tock in #{inspect self}"
        run_ticker(true, next_member)
      after @interval ->
        if active do
          IO.puts "tick in #{inspect self}"
          send(next_member, {:tick})
        end
        run_ticker(false, next_member)
    end
  end

  def run_attach(existing) do
    send(existing, {:attach, self})
    wait_attach_ack(false)
  end

  def wait_attach_ack(active) do
    receive do
      {:attach_ack, next_member} ->
        run_ticker(active, next_member)
      {:tick} ->
        wait_attach_ack(true)
    end
  end

end
