defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({ :push, newval }, list) do
    { :noreply, list ++ [newval] }
  end
end
