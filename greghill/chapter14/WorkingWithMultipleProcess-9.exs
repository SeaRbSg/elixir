defmodule FelineFinder do

  def find_cat(scheduler) do
    send scheduler, { :ready, self }
    receive do
      { :find_cat, n, client } ->
        send client, { :answer, n, find_cat_search(n), self }
        find_cat(scheduler)
      { :shutdown } ->
        exit(:normal)
    end
  end

  def find_cat_search(file_name) do
    file_contents = File.read!(file_name)
    Regex.scan(~r/ (C|c)at |(C|c)at | (C|c)at./, file_contents)
    |> length 
  end

end
defmodule Scheduler do

  def run(num_processes, module, func, to_calculate) do
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self]) end)
    |> schedule_processes(func,to_calculate, [])
  end

  defp schedule_processes(processes,func, queue, results ) do
    
    receive do 
      {:ready, pid} when length(queue) > 0 ->
        [ next | tail ] = queue
        send pid, {func, next, self}
        schedule_processes(processes,func, tail, results)

      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid),func, queue, results)
        else
          Enum.sort(results, fn {n1,_}, {n2,_}  -> n1 <= n2 end)
        end

      {:answer, number, result, _pid} ->
        schedule_processes(processes,func, queue, [ {number, result} | results ])
    end
  end
end

File.cd!("test_files/")
to_process = File.ls!(".")

Enum.each 1..10, fn num_processes ->
  {time, result} = :timer.tc(Scheduler, :run, 
                               [num_processes, FelineFinder, :find_cat, to_process])
  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n #   time (s)"
  end
  :io.format "~2B     ~.2f~n", [num_processes, time/1000000.0]
end

