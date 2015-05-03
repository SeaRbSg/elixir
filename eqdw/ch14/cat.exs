defmodule CatCounter do
  def find_cats(dir, max_procs) do
    files = File.ls!(dir)

    files = Enum.map(files, fn (file) -> dir <> "/" <> file end)
            |> Enum.filter( fn (file) -> File.regular?(file) end )

    Enum.each 1..max_procs, fn num_processes ->
      {time, result} = :timer.tc(Scheduler, :run, [num_processes, CatCounter, :cat, files])

      if num_processes == 1 do
        IO.puts inspect result
        IO.puts "\n # time (s)"
      end
      :io.format "~2B ~.2f~n", [num_processes, time/1000000.0]
    end
  end

  def cat(scheduler) do
    send scheduler, {:ready, self}
    receive do
      {:process, file, client } ->
        send client, { :count, file, count_cats(file), self }
        cat(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  def count_cats(file) do
    File.read!(file)
    |> String.split("cat")
    |> length
    |> (&(&1-1)).()
  end
end

defmodule Scheduler do
  def run(num_processes, module, func, to_calc) do
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self]) end)
    |> schedule_processes(to_calc, [])
  end

  defp schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [ next | tail ] = queue
        send pid, {:process, next, self}
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          Enum.sort(results, fn {x, _}, {y, _} -> x <= y end)
        end

      {:answer, input, result, _pid} ->
        schedule_processes(processes, queue, [ {input, result} | results])
    end
  end
end


