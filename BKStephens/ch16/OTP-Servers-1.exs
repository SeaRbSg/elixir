#You’re going to start creating a server that implements a stack. The call that initializes your stack will pass in a list that is the initial stack contents.
#For now, only implement the pop interface. It’s acceptable for your server to crash if someone tries to pop from an empty stack.
#For example, if initialized with [5,"cat",9], successive calls to pop will return 5, "cat", and 9.

#this is almost straight from the docs: http://elixir-lang.org/docs/v1.0/elixir/GenServer.html
defmodule MyStack do
  use GenServer

  def handle_call(:pop, _from, [ head | tail ]) do
    { :reply, head, tail }
  end
end

{ :ok, pid } = GenServer.start_link(MyStack, [5, "cat", 9])
GenServer.call(pid, :pop)
