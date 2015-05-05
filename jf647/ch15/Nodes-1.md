```
M00972939 ➜  ch15 git:(master) iex --sname one
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(one@M00972939)1> fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end
#Function<20.90072148/0 in :erl_eval.expr/5>
iex(one@M00972939)2> Node.spawn(:"one@M00972939", fun)
Nodes-1.md
#PID<0.67.0>
iex(one@M00972939)3> Node.spawn(:"two@M00972939", fun)
#PID<9000.69.0>
spawn,WorkingWithMultipleProcesses-1.md,WorkingWithMultipleProcesses-2.exs,WorkingWithMultipleProcesses-2.md,WorkingWithMultipleProcesses-3.exs,WorkingWithMultipleProcesses-3.md,WorkingWithMultipleProcesses-4.md,WorkingWithMultipleProcesses-5.md,WorkingWithMultipleProcesses-6.md,WorkingWithMultipleProcesses-7.exs,WorkingWithMultipleProcesses-7.md,WorkingWithMultipleProcesses-8.exs,WorkingWithMultipleProcesses-8.md,WorkingWithMultipleProcesses-9.exs
iex(one@M00972939)4>
```

```
M00972939 ➜  ch14 git:(master) ✗ iex --sname two
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(two@M00972939)1>
```
