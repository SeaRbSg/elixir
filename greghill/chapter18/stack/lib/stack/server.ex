defmodule Stack.Server do 
  use GenServer

  #### External API
  def start_link (stash_pid) do 
    IO.puts "In Stack.Server, Started server: #{__MODULE__}"
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  # Using __MODULE__ means that we can only start one of these?
  def pop do 
    GenServer.call(__MODULE__, :pop)
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

  def init(stash_pid) do
    IO.puts "Getting Stash value"
    initial_list = Stack.Stash.get_value stash_pid
    IO.puts "Stash value: #{IO.inspect initial_list}"
    {:ok,{initial_list, stash_pid}}
  end

  def handle_call({:setstack, items}, _from, {_current_stack,stash_pid}) do 
    {:reply, {items,stash_pid}, {items,stash_pid}}
  end

  def handle_call(:pop, _from, {[item|remaining], stash_pid}) do 
    {:reply, item, {remaining,stash_pid}}
  end

  def handle_call(:getstack, _from, {current_stack,stash_pid}) do 
    {:reply, current_stack, {current_stack,stash_pid}}
  end

  def handle_cast({:push, value}, {current_state,stash_pid}) do
    {:noreply, {[value|current_state],stash_pid}}
  end

  def handle_cast(:stopstack, current_state) do
    {:stop, "User requested closedown.", current_state }
  end

  def terminate(_reason, {current_stack, stash_pid}) do
    Stack.Stash.set_value(stash_pid, current_stack)
  end
end