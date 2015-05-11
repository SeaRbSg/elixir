defmodule RingTicker do
  @interval 2000
  @master :ring_ticker_master

  def join do
    pid = spawn(__MODULE__, :receiver, [])
    case :global.whereis_name(@master) do
      :undefined -> cycle_master([pid])
      master_pid -> send master_pid, {:join, pid}
    end
  end

  def receiver(queue \\ []) do
    receive do
      {:join, pid} ->
        receiver(queue ++ [pid])
      {:become_master, new_queue} ->
       :global.re_register_name(@master, self)
        receiver(new_queue)
      after @interval ->
        cycle_master(queue)
        receiver
    end
  end

  defp cycle_master(_queue = []), do: []
  defp cycle_master(queue) do
    [ head | _tail ] = queue
    IO.puts "tick #{inspect :erlang.localtime} #{inspect head}"
    send head, { :become_master, cycle_queue(queue) }
  end

  defp cycle_queue([only_element]), do: [only_element]
  defp cycle_queue([ next | rest]), do: rest ++ [next]
end
