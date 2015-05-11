defmodule Stack.Server do 
  use GenServer

  #### External API
  def start_link (initial_list) do 
    GenServer.start_link(__MODULE__, initial_list, name: __MODULE__)
    IO.puts "Started server: #{__MODULE__}"
  end

  # Using __MODULE__ means that we can only start one of these?
  def pop do 
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) when is_bitstring(value) do
    System.halt("Illegal value")
  end

  def push(value) do 
    GenServer.cast(__MODULE__, {:push, value})
  end

  def get_stack do
    GenServer.call(__MODULE__, :getstack)
  end

  def set_stack(items) do
    GenServer.call(__MODULE__, {:setstack,items})
  end

  def stop_stack do
    GenServer.cast(__MODULE__, :stopstack)
  end

  #### GenServer API
  def handle_call({:setstack, items}, _from, _current_state) do 
    {:reply, items, items}
  end

  def handle_call(:pop, _from, [item|remaining]) do 
    {:reply, item, remaining}
  end

  def handle_call(:getstack, _from, current_stack) do 
    {:reply, current_stack, current_stack}
  end

  def handle_cast({:push, value}, current_state) do
    {:noreply, [value|current_state]}
  end

  def handle_cast(:stopstack, current_state) do
    {:stop, "User requested closedown.", current_state }
  end

  def terminate(reason, state) do
    IO.puts "Terminating #{__MODULE__}: #{inspect reason}. Final State: #{inspect state}" 
  end
end