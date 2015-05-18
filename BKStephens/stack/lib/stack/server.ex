defmodule Stack.Server do
  use GenServer

  # External API
  def start_link(stash_pid), do: GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  def pop, do: GenServer.call(__MODULE__, :pop)
  def push(item), do: GenServer.cast(__MODULE__, { :push, item })

  # GenServer  
  def init(stash_pid) do
    list = Stack.Stash.get_value stash_pid
    { :ok, { list, stash_pid } }
  end

  def handle_call(:pop, _from, { list, stash_pid }) do
    [ head | tail ] = list
    { :reply, head, { tail, stash_pid } }
  end

  def handle_cast({ :push, element }, { list, stash_pid }) do
    explode(element)
    new_list = [ element | list ]
    { :noreply, { new_list, stash_pid } }
  end

  def terminate(_reason, { list, stash_pid }) do
    Stack.Stash.save_value(stash_pid, list)
  end

  defp explode("boom") do raise "BOOM!" end
  defp explode(_) do end
end
