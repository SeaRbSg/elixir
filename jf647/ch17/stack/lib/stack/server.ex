defmodule Stack.Server do
  use GenServer

  def start_link(stash_pid) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(newval) do
    GenServer.cast __MODULE__, {:push, newval}
  end

  def init(stash_pid) do
    current_list = Stack.Stash.get_list stash_pid
    {:ok, {current_list, stash_pid}}
  end

  def handle_call(:pop, _from, {[head | tail], stash_pid}) do
    { :reply, head, {tail, stash_pid} }
  end

  def handle_cast({ :push, newval }, _) when is_integer(newval) and newval < 10 do
    raise RuntimeError, message: "can't push integers less than 10"
  end

  def handle_cast({ :push, newval }, {list, stash_pid}) do
    { :noreply, {list ++ [newval], stash_pid} }
  end

  def terminate(reason, {list, stash_pid}) do
    Stack.Stash.save_list stash_pid, list
    raise RuntimeError, message: reason
  end
end
