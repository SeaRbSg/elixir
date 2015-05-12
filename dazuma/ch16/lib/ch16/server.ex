defmodule Ch16.Server do

  # API

  def start_link(), do: start_link([])
  def start_link(stack) when is_list(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def push(val) do
    GenServer.cast(__MODULE__, {:push, val})
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end


  # Implementation

  use GenServer

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, val}, stack) do
    {:noreply, [val | stack]}
  end

  def terminate(reason, state) do
    IO.puts("**** TERMINATED: #{inspect(reason)}")
  end

end
