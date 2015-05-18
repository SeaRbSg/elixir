defmodule Stack2.Supervisor do

  use Supervisor

  def start_link(initial_stack) do
    result = {:ok, sup_pid} = Supervisor.start_link(__MODULE__, [])
    {:ok, stash_pid} = Supervisor.start_child(sup_pid,
      worker(Stack2.Stash, [initial_stack]))
    Supervisor.start_child(sup_pid, supervisor(Stack2.SubSupervisor, [stash_pid]))
    result
  end

  def init(_) do
    supervise([], strategy: :one_for_one)
  end

end
