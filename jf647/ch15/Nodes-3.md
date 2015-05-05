```
M00972939 ➜  ch15 git:(master) ✗ iex --sname one Nodes-3.ex
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Nodes-3.ex:1: warning: redefining module Ticker
Nodes-3.ex:44: warning: redefining module Client
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(one@M00972939)1> Node.connect :"one@M00972939"
true
iex(one@M00972939)2> Node.connect :"two@M00972939"
true
iex(one@M00972939)3> Node.connect :"three@M00972939"
true
iex(one@M00972939)4> Ticker.start
:yes
tick
tick
registering #PID<11882.88.0>
tick
tick to #PID<11882.88.0>
registering #PID<11953.90.0>
tick
tick to #PID<11953.90.0>
tick
tick to #PID<11882.88.0>
tick
tick to #PID<11953.90.0>
tick
tick to #PID<11882.88.0>
tick
tick to #PID<11953.90.0>
iex(one@M00972939)5> Client.start
registering #PID<0.88.0>
{:register, #PID<0.88.0>}
tick
tick to #PID<11882.88.0>
tick
tick to #PID<0.88.0>
tock in client
tick
tick to #PID<11953.90.0>
tick
tick to #PID<11882.88.0>
tick
tick to #PID<0.88.0>
tock in client
tick
tick to #PID<11953.90.0>
tick
tick to #PID<11882.88.0>
tick
tick to #PID<0.88.0>
tock in client
tick
tick to #PID<11953.90.0>
tick
tick to #PID<11882.88.0>
tick
tick to #PID<0.88.0>
tock in client
iex(one@M00972939)6>
```
