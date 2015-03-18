# file on command line

```
M00972939 ➜  ch6 git:(master) ✗ iex ModulesAndFunctions-1.exs
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Times.double(123)
246
iex(2)> Times.triple(123)
369
iex(3)>
```

# compile in iex

```
M00972939 ➜  ch6 git:(master) ✗ iex
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> c "ModulesAndFunctions-1.exs"
[Times]
iex(2)> Times.double(123)
246
iex(3)> Times.triple(123)
369
```
