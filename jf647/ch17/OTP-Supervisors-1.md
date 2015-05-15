* state after restart was empty (i.e. the args passed to the worker spec)

```
M00972939 ➜  stack git:(master) ✗ iex -S mix
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Compiled lib/stack.ex
Generated stack.app
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Stack.Server.push(15)
:ok
iex(2)> Stack.Server.pop
15
iex(3)> Stack.Server.pop
** (exit) exited in: GenServer.call(Stack.Server, :pop, 5000)
    ** (EXIT) an exception was raised:
        ** (RuntimeError) can't pop an empty stack
            (stack) lib/server.ex:29: Stack.Server.terminate/2
            (stdlib) gen_server.erl:621: :gen_server.try_terminate/3
            (stdlib) gen_server.erl:787: :gen_server.terminate/7
            (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3

06:30:46.232 [error] GenServer Stack.Server terminating
Last message: :pop
State: []
** (exit) an exception was raised:
    ** (RuntimeError) can't pop an empty stack
        (stack) lib/server.ex:29: Stack.Server.terminate/2
        (stdlib) gen_server.erl:621: :gen_server.try_terminate/3
        (stdlib) gen_server.erl:787: :gen_server.terminate/7
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
    (elixir) lib/gen_server.ex:356: GenServer.call/3
iex(3)> Stack.Server.push(15)
:ok
iex(4)> Stack.Server.pop
15
iex(5)> Stack.Server.pop
** (exit) exited in: GenServer.call(Stack.Server, :pop, 5000)
    ** (EXIT) an exception was raised:
        ** (RuntimeError) can't pop an empty stack
            (stack) lib/server.ex:29: Stack.Server.terminate/2
            (stdlib) gen_server.erl:621: :gen_server.try_terminate/3
            (stdlib) gen_server.erl:787: :gen_server.terminate/7
            (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
    (elixir) lib/gen_server.ex:356: GenServer.call/3

06:30:54.249 [error] GenServer Stack.Server terminating
Last message: :pop
State: []
** (exit) an exception was raised:
    ** (RuntimeError) can't pop an empty stack
        (stack) lib/server.ex:29: Stack.Server.terminate/2
        (stdlib) gen_server.erl:621: :gen_server.try_terminate/3
        (stdlib) gen_server.erl:787: :gen_server.terminate/7
        (stdlib) proc_lib.erl:237: :proc_lib.init_p_do_apply/3
iex(5)>
```
