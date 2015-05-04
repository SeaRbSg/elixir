defmodule Chain do

  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self,
      fn (_,send_to) ->
        spawn(Chain, :counter, [send_to])
      end
    # start the count by sending
    send last, 0
    # and wait for the result to come back to us
    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end


# Some typical runs:
# 
# % elixir -r ex1.exs -e "Chain.run(10)"
# {3768, "Result is 10"}
# % elixir -r ex1.exs -e "Chain.run(100)"
# {4393, "Result is 100"}
# % elixir -r ex1.exs -e "Chain.run(1000)"
# {13241, "Result is 1000"}
# % elixir -r ex1.exs -e "Chain.run(10000)"
# {90629, "Result is 10000"}
# % elixir -r ex1.exs -e "Chain.run(400000)"
#
# 18:53:12.762 [error] Too many processes
#
#
# ** (SystemLimitError) a system limit has been reached
#     :erlang.spawn(Chain, :counter, [#PID<0.49.8>])
#     ex1.exs:13: anonymous fn/2 in Chain.create_processes/1
#     (elixir) lib/enum.ex:1266: anonymous fn/3 in Enum.reduce/3
#     (elixir) lib/range.ex:77: Enumerable.Range.reduce/6
#     (elixir) lib/enum.ex:1265: Enum.reduce/3
#     ex1.exs:11: Chain.create_processes/1
#     (stdlib) timer.erl:194: :timer.tc/3
#     ex1.exs:25: Chain.run/1
#
# % elixir --erl "+P 1000000" -r ex1.exs -e "Chain.run(400000)"
# {2745841, "Result is 400000"}
# % elixir --erl "+P 1000000" -r ex1.exs -e "Chain.run(1000000)"
# {6932228, "Result is 1000000"}
