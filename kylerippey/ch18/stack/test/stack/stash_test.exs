defmodule StashTest do
  use ExUnit.Case

  import Stack.Stash

  setup do
    {:ok, stash} = Stack.Stash.start_link(123)
    {:ok, stash: stash}
  end

  test "can get value from the stash", context do
    assert 123 == Stack.Stash.get_value context[:stash]
  end

  test "can save value to the stash", context do
    assert :ok == Stack.Stash.save_value context[:stash], 456
    assert 456 == Stack.Stash.get_value context[:stash]
  end
end
