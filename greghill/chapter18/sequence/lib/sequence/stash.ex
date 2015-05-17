defmodule Sequence.Stash do 
  use GenServer
  @vsn "0"
  #### External API
  def start_link (current_number) do 
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def get_value stash_pid do
    GenServer.call stash_pid, :get_value
  end

  def save_value(stash_pid, value) do
    GenServer.cast stash_pid, {:save_value, value}
  end

  #### GenServer Implementation
  def handle_call(:get_value, _from, current_value) do
    {:reply, current_value, current_value}
  end

  def handle_cast({:save_value, new_value}, _current_value ) do
    {:noreply, new_value}
  end



end