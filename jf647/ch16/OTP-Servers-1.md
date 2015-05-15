```
M00972939 ➜  stack git:(master) ✗ iex -S mix
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Compiled lib/stack.ex
Generated stack.app
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> {:ok, pid} = GenServer.start_link(Stack.Server, [5, "cat", 9])
{:ok, #PID<0.93.0>}
iex(2)> GenServer.call(pid, :pop)
5
iex(3)> GenServer.call(pid, :pop)
"cat"
iex(4)> GenServer.call(pid, :pop)
9
iex(5)> GenServer.call(pid, :pop)
** (EXIT from #PID<0.91.0>) an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
        (stack) lib/stack.ex:4: Stack.Server.handle_call(:pop, {#PID<0.91.0>, #Reference<0.0.0.473>}, [])
        (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:639: :gen_server.handle_msg/5
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3


06:07:12.874 [error] GenServer #PID<0.93.0> terminating
Last message: :pop
State: []
** (exit) an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
        (stack) lib/stack.ex:4: Stack.Server.handle_call(:pop, {#PID<0.91.0>, #Reference<0.0.0.473>}, [])
        (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:639: :gen_server.handle_msg/5
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```
