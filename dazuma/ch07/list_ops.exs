# A few sample implementations of list functions described on page 73.

defmodule ListOps do


  def reverse(list), do: _reverse(list, [])

  defp _reverse([], result), do: result
  defp _reverse([h | t], result), do: _reverse(t, [h | result])


  def concat(l1, l2), do: reverse(l1) |> _concat(l2)

  defp _concat([], l2), do: l2
  defp _concat([h | t], l2), do: _concat(t, [h | l2])


  def flatten(list), do: _flatten(list, []) |> reverse

  def _flatten([], result), do: result
  def _flatten([h | t], result), do: _flatten(t, _flatten(h, result))
  def _flatten(elem, result), do: [elem | result]


  def foldl([], acc, func), do: acc
  def foldl([h | t], acc, func), do: foldl(t, func.(h, acc), func)

  def foldr(list, acc, func), do: list |> reverse |> foldl(acc, func)


end
