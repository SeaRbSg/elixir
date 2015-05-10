defmodule Sequence.Server do
  use GenServer

  def handle_call(:pop, _from, [head|tail]) do
    { :reply, head, tail }
  end
end
