Raise exception

```
M00972939 ➜  ch14 git:(master) ✗ elixir WorkingWithMultipleProcesses-3.exs

17:22:00.707 [error] Error in process <0.57.0> with exit value: {#{'__exception__'=>true,'__struct__'=>'Elixir.RuntimeError',message=><<9 bytes>>},[{'Elixir.Ch14Ex3',doit,0,[{file,"WorkingWithMultipleProcesses-3.exs"},{line,6}]}]}


"about to exit"
{:EXIT, #PID<0.57.0>, {%RuntimeError{message: "Giving up"}, [{Ch14Ex3, :doit, 0, [file: 'WorkingWithMultipleProcesses-3.exs', line: 6]}]}}
^C
```
