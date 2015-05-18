defmodule Stack2.SubSupervisor do

  use Supervisor

  def start_link(stash_pid) do
    {:ok, _pid} = Supervisor.start_link(__MODULE__, stash_pid)
  end

  def init(stash_pid) do
    children = [
      worker(Stack2.Server, [stash_pid])
    ]
    supervise(children, strategy: :one_for_one)
  end

end
