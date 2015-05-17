defmodule Stack.SubSupervisor do
  use Supervisor

  def start_link(stash_pid) do
    IO.puts "In Stack.SubSupervisor " 
    {:ok, _pid} = Supervisor.start_link(__MODULE__, stash_pid)
    IO.puts "SubSupervisor pid: #{inspect _pid}"
    {:ok, _pid}
  end
  def init(stash_pid) do
    child_processes = [ worker(Stack.Server, [stash_pid]) ]
    supervise child_processes, strategy: :one_for_one
  end
end