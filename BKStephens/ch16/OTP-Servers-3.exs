defmodule MyStack do
  use GenServer

  def handle_call(:pop, _from, [ head | tail ]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, item}, stack) do
    { :noreply, [ item | stack ] }
  end
end

{ :ok, pid } = GenServer.start_link(MyStack, [:cat], name: :trololol)
GenServer.call(:trololol, :pop)
GenServer.cast(:trololol, { :push, :dog })
GenServer.call(:trololol, :pop)
