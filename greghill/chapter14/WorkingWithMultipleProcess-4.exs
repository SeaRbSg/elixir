defmodule Processes do 
  import :timer, only: [ sleep: 1 ]

  def responder parent_pid do
    send parent_pid, "barney"
    raise RuntimeError, "kaboommed"
  
  end

  def run do
    spawn_link(Processes, :responder, [ self ]) 

    receive do 
      msg -> IO.puts msg
    end

    sleep 2000

  end
end

Processes.run

# $ elixir WorkingWithMultipleProcess-4.exs

# 16:35:53.641 [error] Error in process <0.55.0> with exit value: {#{'__exception__'=>true,'__struct__'=>'Elixir.RuntimeError',message=><<9 bytes>>},[{'Elixir.Processes',responder,1,[{file,"WorkingWithMultipleProcess-4.exs"},{line,6}]}]}


# ** (EXIT from #PID<0.49.0>) an exception was raised:
#     ** (RuntimeError) kaboommed
#         WorkingWithMultipleProcess-4.exs:6: Processes.responder/1
