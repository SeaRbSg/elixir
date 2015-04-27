
defmodule FetcherTest do
  use ExUnit.Case

  alias Conditions.Fetcher, as: CF


  test "get_temp_data" do
    {:ok, xml} = Conditions.Fetcher.fetch("KDEW")
    {node, rest} = xml |>  Exmerl.XPath.find("//current_observation/temp_f/text()")
    [node_element] = node
    {_, _,_,_,temp,_} = node_element
    assert is_list(temp)

  end
end