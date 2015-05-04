defmodule CountInFiles do
  def count(scheduler) do
    send scheduler, { :ready, self }
    receive do
      { :countwords, file, word, client } ->
        send client, { :answer, file, count_occurence(file, word), self }
        count(scheduler)

      { :shutdown } ->
        exit(:normal)
    end
  end

  defp count_occurence(file, word) do
    length(Regex.scan(~r/#{word}/, File.read!("/usr/share/zoneinfo/#{file}")))
  end
end

defmodule Scheduler do
  def run(num_processes, module, func, files, word) do
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self]) end)
    |> schedule_processes(files, word, [])
  end

  def schedule_processes(processes, queue, word, results) do
    receive do
      { :ready, pid } when length(queue) > 0 ->
        [ next | tail ] = queue
        send pid, { :countwords, next, word, self }
        schedule_processes(processes, tail, word, results)

      { :ready, pid } ->
        send pid, { :shutdown }
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, word, results)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end

      { :answer, file, count, _pid } ->
        schedule_processes(processes, queue, word, [ {file, count} | results])
    end
  end
end

files = File.ls!("/usr/share/zoneinfo") |> Enum.filter fn (x) -> !File.dir?("/usr/share/zoneinfo/#{x}") end
word = "cat"

Enum.each 1..10, fn num_processes ->
  { time, result } = :timer.tc(Scheduler, :run, [num_processes, CountInFiles, :count, files, word])
  if num_processes == 1 do
    IO.puts inspect(result)
    IO.puts "\n #   time (s)"
  end
  :io.format "~2B      ~.2f~n", [num_processes, time/1000000.0]
end
