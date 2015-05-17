defmodule Stack.Server do
  use GenServer

  #public API
  def start_link(stash_pid) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(value) do
    GenServer.cast __MODULE__, {:push, value}
  end

  def crash do
    GenServer.cast __MODULE__, :crash
  end

  def init(stash_pid) do
    current_stack = Stack.Stash.get_stack stash_pid
    { :ok, {current_stack, stash_pid} }
  end

  def handle_call(:pop, _from, { [head|tail], stash_pid }) do
    { :reply, head, {tail, stash_pid} }
  end

  def handle_cast({:push, value}, { stack, stash_pid}) do
    { :noreply, { [value | stack], stash_pid } }
  end

  def handle_cast(:crash, _) do
    raise "DIE DIE DIE DIE DIE"
  end

  def terminate(_reason, {current_stack, stash_pid}) do
    Stack.Stash.save_stack stash_pid, current_stack
  end
end
