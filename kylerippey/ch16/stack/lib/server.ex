defmodule Stack.Server do
  use GenServer

  def start_link(initial) do
    GenServer.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def push(new_element) do
    GenServer.cast(__MODULE__, {:push, new_element})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def handle_call(:pop, _prev, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, new_element}, list) do
    { :noreply, [new_element | list] }
  end

  def terminate(reason, state) do
    IO.puts "[Terminate received] Reason: #{inspect reason}, State: #{inspect state}"
  end
  
end