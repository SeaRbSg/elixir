Spawn Monitor with error message:

```
M00972939 ➜  ch14 git:(master) ✗ elixir WorkingWithMultipleProcesses-3.exs
** (ArgumentError) argument error
    :erlang.send({#PID<0.57.0>, #Reference<0.0.0.113>}, {#PID<0.48.0>, "foo"})
    WorkingWithMultipleProcesses-3.exs:23: (file)
    (elixir) lib/code.ex:316: Code.require_file/2
```

Spawn Monitor with exception:

```
M00972939 ➜  ch14 git:(master) ✗ elixir WorkingWithMultipleProcesses-3.exs
** (ArgumentError) argument error
    :erlang.send({#PID<0.57.0>, #Reference<0.0.0.114>}, {#PID<0.48.0>, "foo"})
    WorkingWithMultipleProcesses-3.exs:23: (file)
    (elixir) lib/code.ex:316: Code.require_file/2
```

I suspect I've just screwed up something at a low level, but I burned too much
time trying to figure it out.
