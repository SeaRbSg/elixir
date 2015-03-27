defmodule Ch7Ex1 do
  def mapsum(list, func), do: sum(map(list, func))

  defp map([], _func), do: []
  defp map([head | tail], func), do: [ func.(head) | map(tail, func) ]

  defp sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head+total)
end
