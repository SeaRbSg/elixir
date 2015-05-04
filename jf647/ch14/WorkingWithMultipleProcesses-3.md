* I always get the exit before the message back from the subproc.
  * perhaps they meant for us to use Process.flag(:trap_exit, true)?
  * with trapped exit, it doesn't matter that I was sleeping when the exit came in:

```
M00972939 ➜  ch14 git:(master) ✗ elixir WorkingWithMultipleProcesses-3.exs
"about to exit"
{:EXIT, #PID<0.57.0>, :boom}
^C
```
