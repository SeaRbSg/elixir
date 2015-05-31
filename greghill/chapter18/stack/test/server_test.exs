defmodule ServerTest do 
  use ExUnit.Case, async: false
  alias Stack.Server, as: SS
 


  setup_all do
    SS.set_stack([40,50,60])
    {:ok, startmsg: "List set for testing."}
  end
  # setup do
  #   IO.puts "This is a setup callback"

  #   on_exit fn ->
  #     IO.puts "This is invoked once the test is done"
  #   end

  #   # Returns extra metadata, it must be a dict
  #   {:ok, hello: "world"}
  # end
  # This test assumes an initial value is set as [1,2,3]
  # could the test unit set it's own before the server starts?
  # setup do
  #   IO.puts "This is a setup callback"
  #   :sys.replace_state(Stack.Stash, fn _ -> [] end)
  #   IO.puts "#{IO.inspect SS.get_stack}" 
  # end

  test "pops and pushes a value to and from the stack" do
    assert SS.pop == 40
    assert SS.push(90) == :ok
    assert [90,50,60] == SS.get_stack 
  end


end