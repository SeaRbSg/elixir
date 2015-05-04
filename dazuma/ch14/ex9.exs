# Genericized the scheduler a bit so all you have to pass in is a function
# rather than something that knows how to receive messages.
defmodule Scheduler do
  def run(num_processes, module, func, to_calculate) do
    (1..num_processes)
      |> Enum.map(fn(_) -> spawn_link(Scheduler, :server, [self, module, func]) end)
      |> schedule_processes(to_calculate, [])
  end

  defp schedule_processes([], _queue, results), do: results
  defp schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} ->
        case queue do
          [] -> 
            send pid, {:shutdown}
            schedule_processes(List.delete(processes, pid), queue, results)
          [next | tail] ->
            send pid, {:job, next}
            schedule_processes(processes, tail, results)
        end
      {:answer, input, output} ->
        schedule_processes(processes, queue, [ {input, output} | results ])
    end
  end

  def server(scheduler, module, func) do
    send scheduler, {:ready, self}
    receive do
      {:job, input} ->
        send scheduler, {:answer, input, :erlang.apply(module, func, [input])}
        server(scheduler, module, func)
      {:shutdown} ->
        exit(:normal)
    end
  end
end


defmodule FibSolver do
  # very inefficient, deliberately
  def fib_calc(0), do: 0
  def fib_calc(1), do: 1
  def fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)
end


defmodule CatCounter do
  def count_cats(path) do
    Regex.scan(~r/cat/, path |> File.read!) |> Enum.count
  end
end


# See catfiles/create.exs for a tool to create lots of files

to_process = File.ls!("catfiles")
|> Enum.filter(&(Path.extname(&1) == ".txt"))
|> Enum.map(&("catfiles/#{&1}"))

Enum.each 1..10, fn num_processes ->
  {time, result} =
    :timer.tc(Scheduler, :run, [num_processes, CatCounter, :count_cats, to_process])
  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n # time (s)"
  end
  :io.format "~2B ~.2f~n", [num_processes, time/1000000.0]
end
