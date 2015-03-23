defmodule Summer do
  def sum(0), do: 0
  def sum(n), do: n + sum(n-1)
end
