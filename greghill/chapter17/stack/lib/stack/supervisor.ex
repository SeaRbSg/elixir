defmodule Stack.Supervisor do
  use Supervisor
  def start_link(initial_list) do
    IO.puts "starting Supervisor"
    result = {:ok, sup } = Supervisor.start_link(__MODULE__, [initial_list]) 
    IO.puts "Supervisor pid: #{inspect sup}"
    start_workers(sup, initial_list)
    result
  end
  def start_workers(sup, initial_list) do

    # Start the stash worker
    {:ok, stash} = 
       Supervisor.start_child(sup, worker(Stack.Stash, [initial_list]))
       IO.puts "Stash pid: #{inspect stash}"
    # and then the subsupervisor for the actual stack server
    {:ok, server} = 
      Supervisor.start_child(sup, supervisor(Stack.SubSupervisor, [stash]))
      IO.puts "server pid: #{inspect server}"  
  end
  def init(_) do
    supervise [], strategy: :one_for_one

  end
end

#Need to read up on the Supervisor.start_child; it adds processes to the 
#"supervise" list. In this module we as two processes to the supervise list.