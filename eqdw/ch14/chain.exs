# Interestingly, when I run this I get runtimes somewhere between 1.5x - 2x
# the times reported in the textbook. My computer is much newer and more
# powerful. What gives?

# Hypotheses:
#   Elixir performance has suffered as more features were added
#   OSX 10.10 is less performant than whatever Dave's on
#   Laptop not plugged in
#   Gremlins

defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n+1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self,
             fn (_, send_to) ->
               spawn(Chain, :counter, [send_to])
             end

    send last, 0

    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end
