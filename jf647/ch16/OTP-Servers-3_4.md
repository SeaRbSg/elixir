```
M00972939 ➜  stack git:(master) ✗ iex -S mix
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Compiled lib/stack.ex
Generated stack.app
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Stack.Server.start_link([])
{:ok, #PID<0.93.0>}
iex(2)> Stack.Server.push(5)
:ok
iex(3)> Stack.Server.push("cat")
:ok
iex(4)> Stack.Server.push(9)
:ok
iex(5)> Stack.Server.pop
5
iex(6)> Stack.Server.pop
"cat"
iex(7)> Stack.Server.pop
9
iex(8)> Stack.Server.pop
** (EXIT from #PID<0.91.0>) an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
        (stack) lib/stack.ex:16: Stack.Server.handle_call(:pop, {#PID<0.91.0>, #Reference<0.0.0.494>}, [])
        (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:639: :gen_server.handle_msg/5
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3

Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)

06:17:05.171 [error] GenServer Stack.Server terminating
Last message: :pop
State: []
** (exit) an exception was raised:
    ** (FunctionClauseError) no function clause matching in Stack.Server.handle_call/3
        (stack) lib/stack.ex:16: Stack.Server.handle_call(:pop, {#PID<0.91.0>, #Reference<0.0.0.494>}, [])
        (stdlib) gen_server.erl:607: :gen_server.try_handle_call/4
        (stdlib) gen_server.erl:639: :gen_server.handle_msg/5
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
iex(1)>
```
