defmodule Sequence.Supervisor do
  use Supervisor
  def start_link(initial_number) do
    result = {:ok, sup } = Supervisor.start_link(__MODULE__, [initial_number]) 
    start_workers(sup, initial_number)
    result
  end
  def start_workers(sup, initial_number) do
    # Start the stash worker
    {:ok, stash} = 
       Supervisor.start_child(sup, worker(Sequence.Stash, [initial_number]))
    # and then the subsupervisor for the actual sequence server
    Supervisor.start_child(sup, supervisor(Sequence.SubSupervisor, [stash]))
  end
  def init(_) do
    supervise [], strategy: :one_for_one
  end
end