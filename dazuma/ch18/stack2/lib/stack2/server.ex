defmodule Stack2.Server do

  # API

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def push(val) do
    GenServer.cast(__MODULE__, {:push, val})
  end

  def pop() do
    GenServer.call(__MODULE__, :pop)
  end


  # Implementation

  use GenServer

  def init(stash_pid) do
    current_stack = Stack2.Stash.get_value(stash_pid)
    {:ok, {current_stack, stash_pid}}
  end

  def handle_call(:pop, _from, {[h | t], stash_pid}) do
    {:reply, h, {t, stash_pid}}
  end

  def handle_cast({:push, nil}, _state) do
    raise "Cannot push nil"
  end
  def handle_cast({:push, val}, {stack, stash_pid}) do
    {:noreply, {[val | stack], stash_pid}}
  end

  def terminate(_reason, {stack, stash_pid}) do
    Stack2.Stash.set_value(stash_pid, stack)
  end

end
