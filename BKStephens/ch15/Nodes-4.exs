#I believe this has a bug and is not functioning right.
#:global.whereis_name(@master) in the join function seems to always be :undefined

defmodule RingTicker do
  @interval 2000
  @master :ring_ticker_master

  def join do
    pid = spawn(__MODULE__, :receiver, [])
    current_master = :global.whereis_name(@master) 
    #Why is current_master always undefined?
    case current_master do
      :undefined ->
        cycle_master([pid])
      master_pid ->
        send master_pid, {:join, pid}
    end
  end

  def receiver(queue \\ []) do
    receive do
      {:join, pid} ->
        IO.puts "join #{inspect pid}"
        receiver(queue ++ [pid])
      {:become_master, new_queue} ->
        IO.puts "@master: #{inspect @master} self: #{inspect self}"
       :global.re_register_name(@master, self)
        receiver(new_queue)
      after @interval ->
        IO.puts "tick #{inspect :erlang.localtime}"
        cycle_master(queue)
        receiver
    end
  end

  defp cycle_master(queue) do
    send List.first(queue), { :become_master, cycle_queue(queue) }
  end

  defp cycle_queue([only_element]), do: [only_element]
  defp cycle_queue([ next | rest]), do: rest ++ [next]
end
