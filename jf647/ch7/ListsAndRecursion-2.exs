defmodule Ch7Ex2 do
  def max(list), do: _max(list, 0)

  defp _max([], highest), do: highest
  defp _max([head | tail], highest) when head > highest do
    _max(tail, head)
  end
  defp _max([_head | tail], highest), do: _max(tail, highest)
end
