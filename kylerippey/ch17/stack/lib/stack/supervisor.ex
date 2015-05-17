defmodule Stack.Supervisor do
  use Supervisor

  def start_link(initial) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial])
    start_workers(sup, initial)
    result
  end

  def start_workers(sup, initial) do
    # Start the stash worker
    {:ok, stash} = Supervisor.start_child(sup, worker(Stack.Stash, [initial]))

    # then start the actual stack server
    Supervisor.start_child(sup, supervisor(Stack.SubSupervisor, [stash]))
  end
  
  def init(_) do
    supervise [], strategy: :one_for_one
  end
end