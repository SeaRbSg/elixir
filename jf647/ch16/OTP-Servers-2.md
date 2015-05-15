```
M00972939 ➜  stack git:(master) ✗ iex -S mix
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Compiled lib/stack.ex
Generated stack.app
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> {:ok, pid} = GenServer.start_link(Stack.Server, [], [debug: [:trace]])
{:ok, #PID<0.93.0>}
iex(2)> GenServer.cast(pid, {:push, 5})
*DBG* <0.93.0> got cast {push,5}
*DBG* <0.93.0> new state [5]
:ok
iex(3)> GenServer.cast(pid, {:push, "cat"})
*DBG* <0.93.0> got cast {push,<<"cat">>}
*DBG* <0.93.0> new state [5,<<99,97,116>>]
:ok
iex(4)> GenServer.cast(pid, {:push, 9})
*DBG* <0.93.0> got cast {push,9}
*DBG* <0.93.0> new state [5,<<99,97,116>>,9]
:ok
iex(5)> GenServer.call(pid, :pop)
*DBG* <0.93.0> got call pop from <0.91.0>
*DBG* <0.93.0> sent 5 to <0.91.0>, new state [<<99,97,116>>,9]
5
iex(6)> GenServer.call(pid, :pop)
*DBG* <0.93.0> got call pop from <0.91.0>
*DBG* <0.93.0> sent <<"cat">> to <0.91.0>, new state [9]
"cat"
iex(7)> GenServer.call(pid, :pop)
*DBG* <0.93.0> got call pop from <0.91.0>
*DBG* <0.93.0> sent 9 to <0.91.0>, new state []
9
iex(8)> GenServer.call(pid, :pop)
*DBG* <0.93.0> got call pop from <0.91.0>
** (EXIT from #PID<0.91.0>) an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
        (stack) lib/stack.ex:4: Stack.Server.handle_call(:pop, {#PID<0.91.0>, #Reference<0.0.0.497>}, [])
        (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:663: :gen_server.handle_msg/6
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3

Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)

06:12:55.882 [error] GenServer #PID<0.93.0> terminating
Last message: :pop
State: []
** (exit) an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
        (stack) lib/stack.ex:4: Stack.Server.handle_call(:pop, {#PID<0.91.0>, #Reference<0.0.0.497>}, [])
        (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:663: :gen_server.handle_msg/6
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
iex(1)>
```
