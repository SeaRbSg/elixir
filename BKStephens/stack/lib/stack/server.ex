defmodule Stack.Server do
  use GenServer

  # External API
  def start_link(stack), do: GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  def pop, do: GenServer.call(__MODULE__, :pop)
  def push(item), do: GenServer.cast(__MODULE__, { :push, item })

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
