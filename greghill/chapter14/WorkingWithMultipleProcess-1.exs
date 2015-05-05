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

###
# $ elixir -r WorkingWithMultipleProcess-1.exs -e "Chain.run(10)"
# {17581, "Result is 10"}
# $ elixir -r WorkingWithMultipleProcess-1.exs -e "Chain.run(100)"
# {14504, "Result is 100"}
# $ elixir -r WorkingWithMultipleProcess-1.exs -e "Chain.run(100)"
# {17722, "Result is 100"}
# $ elixir -r WorkingWithMultipleProcess-1.exs -e "Chain.run(1000)"
# {22229, "Result is 1000"}
# $ elixir -r WorkingWithMultipleProcess-1.exs -e "Chain.run(10000)"
# {71091, "Result is 10000"}
# $ elixir -r WorkingWithMultipleProcess-1.exs -e "Chain.run(100000)"
# {427155, "Result is 100000"}
# $ elixir -r WorkingWithMultipleProcess-1.exs -e "Chain.run(400_000)"

# 14:16:42.055 [error] Too many processes


# ** (SystemLimitError) a system limit has been reached
#     :erlang.spawn(Chain, :counter, [#PID<0.50.8>])
#     WorkingWithMultipleProcess-1.exs:12: anonymous fn/2 in Chain.create_processes/1
#     (elixir) lib/enum.ex:1266: anonymous fn/3 in Enum.reduce/3
#     (elixir) lib/range.ex:77: Enumerable.Range.reduce/6
#     (elixir) lib/enum.ex:1265: Enum.reduce/3
#     WorkingWithMultipleProcess-1.exs:10: Chain.create_processes/1
#     (stdlib) timer.erl:194: :timer.tc/3
#     WorkingWithMultipleProcess-1.exs:26: Chain.run/1

# $ elixir --erl "+P 1000000" -r WorkingWithMultipleProcess-1.exs -e "Chain.run(400_000)"
# Killed
# $ elixir --erl "+P 1000000" -r WorkingWithMultipleProcess-1.exs -e "Chain.run(400000)"
# Killed
# $ elixir --erl "+P 1000000" -r WorkingWithMultipleProcess-1.exs -e "Chain.run(1000000)"
# Killed
#####