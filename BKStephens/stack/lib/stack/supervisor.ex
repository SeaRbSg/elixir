defmodule Stack.Supervisor do
  use Supervisor
  
  def start_link(list) do
    result = {:ok, sup } = Supervisor.start_link(__MODULE__, [list])
    start_workers(sup, list)
    result
  end
  
  def start_workers(sup, list) do
    {:ok, stash} = Supervisor.start_child(sup, worker(Stack.Stash, [list]))
    Supervisor.start_child(sup, supervisor(Stack.SubSupervisor, [stash]))
  end
  
  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
