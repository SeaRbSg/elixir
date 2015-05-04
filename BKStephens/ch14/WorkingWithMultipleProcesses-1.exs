#Run this code on your machine. See if you get comparable results
defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self, 
      fn (_, send_to) ->
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

#elixir|master⚡ ⇒ elixir -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(10)"
#{4619, "Result is 10"}
#elixir|master⚡ ⇒ elixir -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(100)"
#{5512, "Result is 100"}
#elixir|master⚡ ⇒ elixir -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(1000)"
#{14001, "Result is 1000"}
#elixir|master⚡ ⇒ elixir -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(10000)"
#{95114, "Result is 10000"}
#elixir|master⚡ ⇒ elixir -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(100000)"
#{904616, "Result is 100000"}
#elixir|master⚡ ⇒ elixir -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(1000000)"
#
#19:27:37.435 [error] Too many processes
#
#
#** (SystemLimitError) a system limit has been reached
#    :erlang.spawn(Chain, :counter, [#PID<0.49.8>])
#    BKStephens/ch14/WorkingWithMultipleProcesses-1.exs:13: anonymous fn/2 in Chain.create_processes/1
#    (elixir) lib/enum.ex:1266: anonymous fn/3 in Enum.reduce/3
#    (elixir) lib/range.ex:77: Enumerable.Range.reduce/6
#    (elixir) lib/enum.ex:1265: Enum.reduce/3
#    BKStephens/ch14/WorkingWithMultipleProcesses-1.exs:11: Chain.create_processes/1
#    (stdlib) timer.erl:194: :timer.tc/3
#    BKStephens/ch14/WorkingWithMultipleProcesses-1.exs:27: Chain.run/1
#
#elixir|master⚡ ⇒ elixir --erl "+P 1000000" -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(1000000)"
#{7429931, "Result is 1000000"}
#elixir|master⚡ ⇒ elixir --erl "+P 100000000" -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(100000000)"
#[1]    1661 killed     elixir --erl "+P 100000000" -r  -e "Chain.run(100000000)"
#elixir|master⚡ ⇒ elixir --erl "+P 10000000" -r BKStephens/ch14/WorkingWithMultipleProcesses-1.exs -e "Chain.run(10000000)"
#{127905283, "Result is 10000000"}
