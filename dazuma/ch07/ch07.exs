
defmodule MyList do


  # ListsAndRecursion-0

  def sum_without_accumulator([]), do: 0
  def sum_without_accumulator([h | t]), do: h + sum_without_accumulator(t)


  # ListsAndRecursion-1

  def mapsum(list, func), do: _mapsum(list, func, 0)

  defp _mapsum([], _func, sum), do: sum
  defp _mapsum([h | t], func, sum), do: _mapsum(t, func, sum + func.(h))


  # ListsAndRecursion-2

  def max(list), do: _max(list, nil)

  defp _max([], cur), do: cur
  defp _max([h | t], nil), do: _max(t, h)
  defp _max([h | t], cur) when h > cur, do: _max(t, h)
  defp _max([_h | t], cur), do: _max(t, cur)


  # ListsAndRecursion-3

  # Note: I tried to do an implementation that supported tail recursion; hence
  # the need to reverse it at the end. (I also implemented reverse directly,
  # although there does exist a List.reverse/1 stdlib function.)
  # This could have been done more simply without an accumulator, but with a
  # possible memory hit.

  def caesar(list, n), do: _caesar(list, n, [])

  defp _caesar([], _, result), do: reverse(result)
  defp _caesar([h | t], n, result), do: _caesar2(t, n, n + h, result) 

  defp _caesar2(t, n, hsum, result) when hsum > ?z, do: _caesar2(t, n, hsum - 26, result)
  defp _caesar2(t, n, hsum, result), do: _caesar(t, n, [hsum | result])

  def reverse(list), do: _reverse(list, [])

  defp _reverse([], result), do: result
  defp _reverse([h | t], result), do: _reverse(t, [h | result])


  # ListsAndRecursion-4

  def span(from, to), do: _span(from, to, [])

  defp _span(from, to, result) when from > to, do: result
  defp _span(from, to, result), do: _span(from, to - 1, [to | result])


end
