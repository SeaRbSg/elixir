### Window 1 ###
# Isaac:kylerippey kyle$ iex --sname node_one

# iex(node_one@Isaac)2> Node.list
# [:node_two@Isaac]

# iex(node_one@Isaac)1> fun = fn -> IO.puts(Enum.join(File.ls!, ",")) end
# #Function<20.90072148/0 in :erl_eval.expr/5>

# iex(node_one@Isaac)3> Node.spawn(:"node_one@Isaac", fun)
# ch01,ch02,ch05,ch06,ch07,ch10,ch11,ch12,ch13,ch14,ch15,euler
# #PID<0.71.0>

# iex(node_one@Isaac)4> Node.spawn(:"node_two@Isaac", fun)
# #PID<9033.74.0>
# chapter1,chapter10,chapter11,chapter12,chapter13,chapter14,chapter15,chapter5,chapter6,chapter7,chapter8,dave

### Window 2 ###
# Isaac:greghill kyle$ iex --sname node_two

# iex(node_two@Isaac)1> Node.list
# []

# iex(node_two@Isaac)2> Node.connect(:"node_one@Isaac")
# true

# iex(node_two@Isaac)3> Node.list
# [:node_one@Isaac]

