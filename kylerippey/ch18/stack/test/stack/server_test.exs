defmodule ServerTest do
  use ExUnit.Case

  import Stack.Server

  test "can push and pop values" do
    assert :ok == Stack.Server.push 42
    assert 42 == Stack.Server.pop
  end

end
