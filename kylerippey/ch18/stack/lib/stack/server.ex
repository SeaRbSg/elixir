defmodule Stack.Server do
  use GenServer

  def start_link(stash_pid) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def push(new_element) do
    GenServer.cast(__MODULE__, {:push, new_element})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  ## GenServer implementation

  def init(stash_pid) do
    list = Stack.Stash.get_value stash_pid
    {:ok, {list, stash_pid}}
  end

  def handle_cast({:push, new_element}, {list, stash_pid}) do
    { :noreply, {[new_element | list], stash_pid} }
  end

  def handle_call(:pop, _prev, {[head | tail], stash_pid}) do
    { :reply, head, {tail, stash_pid} }
  end

  def terminate(reason, {list, stash_pid}) do
    IO.puts("Saving state before termination...")
    Stack.Stash.save_value stash_pid, list
  end
end