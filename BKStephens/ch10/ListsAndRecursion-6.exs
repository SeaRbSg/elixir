#flatten a nested list
defmodule MyEnum do
  def flatten([]), do: []
  def flatten([head|tail]) when is_list(head) do
    flatten(head ++ tail)
  end
  def flatten([head|tail]), do: [head|flatten(tail)]
end
