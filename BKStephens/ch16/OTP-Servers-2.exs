defmodule MyStack do
  use GenServer

  def handle_call(:pop, _from, [ head | tail ]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, item}, stack) do
    { :noreply, [ item | stack ] }
  end
end

{ :ok, pid } = GenServer.start_link(MyStack, [:cat])
GenServer.call(pid, :pop)
GenServer.cast(pid, { :push, :dog })
GenServer.call(pid, :pop)
