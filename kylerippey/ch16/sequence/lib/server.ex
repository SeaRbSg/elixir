defmodule Sequence.Server do
  use GenServer

  def handle_call(:pop, _prev, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, new_element}, list) do
    { :noreply, [new_element | list] }
  end
end