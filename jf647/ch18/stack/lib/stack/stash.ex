defmodule Stack.Stash do
  use GenServer

  def start_link(current_list) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, current_list)
  end

  def save_list(pid, list) do
    GenServer.cast pid, {:save_value, list}
  end

  def get_list(pid) do
    GenServer.call pid, :get_value
  end

  def handle_call(:get_value, _from, list) do
    {:reply, list, list}
  end

  def handle_cast({:save_value, newlist}, _list) do
    {:noreply, newlist}
  end
end
