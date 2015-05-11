defmodule MyStack do
  use GenServer

  # External API
  def start_link(stack), do: GenServer.start_link(__MODULE__, stack)
  def start_link(stack, name), do: GenServer.start_link(__MODULE__, stack, name: name)
  def pop(identifier), do: GenServer.call(identifier, :pop)
  def push(identifier, item), do: GenServer.cast(identifier, { :push, item })

  def handle_call(:pop, _from, [ head | tail ]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, item}, stack) do
    { :noreply, [ item | stack ] }
  end
  
  def terminate(reason, state) do
    IO.puts "Welp, it looks like it is time to ditch this pickle stand because #{inspect reason}. Pickle inventory: #{inspect state}"
  end
end

{ :ok, pid } = MyStack.start_link([:cat])
MyStack.push(pid, :dog)
MyStack.pop(pid)
MyStack.pop(pid)
MyStack.pop(pid)
