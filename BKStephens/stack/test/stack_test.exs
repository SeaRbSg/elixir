defmodule StackTest do
  use ExUnit.Case
 
  setup do
    :sys.replace_state(Stack.Server, fn {_old_state, pid} -> {["Howdy", "ho", "folks"], pid} end)
    :ok
  end
  
  test "the stack has initial values" do
    { stack, pid } = :sys.get_state Stack.Server
    assert stack == ["Howdy", "ho", "folks"]
    refute pid == nil
  end

  test "can push onto the stack" do
    Stack.Server.push "!!!"
    { stack, pid } = :sys.get_state Stack.Server
    assert stack == ["!!!", "Howdy", "ho", "folks"]
  end

  test "can pop items off stack" do
    assert Stack.Server.pop == "Howdy"
    assert Stack.Server.pop == "ho"
    assert Stack.Server.pop == "folks"
  end
end
