```
M00972939 ➜  stack git:(master) ✗ iex -S mix
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Compiled lib/stack.ex
Generated stack.app
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> {:ok, pid} = Stack.Server.start_link([])
{:ok, #PID<0.94.0>}
iex(2)> Stack.Server.push(15)
:ok
iex(3)> Stack.Server.push("cat")
:ok
iex(4)> Stack.Server.push(19)
:ok
iex(5)> Stack.Server.pop
15
iex(6)> Stack.Server.push(5)
M00972939 ➜  stack git:(master) ✗ echo $?
3
M00972939 ➜  stack git:(master) ✗
```
