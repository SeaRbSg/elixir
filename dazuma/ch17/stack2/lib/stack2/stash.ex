defmodule Stack2.Stash do

  # API

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack)
  end

  def get_value(stash_pid) do
    GenServer.call(stash_pid, :get)
  end

  def set_value(stash_pid, stack) do
    GenServer.cast(stash_pid, {:set, stack})
  end


  # Implementation

  use GenServer

  def init(stack) do
    {:ok, {stack}}
  end

  def handle_call(:get, _from, stack) do
    {:reply, stack, stack}
  end

  def handle_cast({:set, nstack}, _ostack) do
    {:noreply, nstack}
  end

  def terminate(reason, _stack) do
    IO.puts("**** TERMINATED STASH: #{inspect(reason)}")
  end

end
