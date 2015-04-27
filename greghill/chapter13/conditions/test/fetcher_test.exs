
defmodule FetcherTest do
  use ExUnit.Case

  alias Conditions.Fetcher, as: CF

  test "get_data" do
    {:ok, xml} = Conditions.Fetcher.fetch("KDEW")
    assert is_string(xml)
  end
end