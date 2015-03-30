# A few sample implementations of list functions described on page 73.

defmodule ListOps do


  def reverse(list), do: _reverse(list, [])

  defp _reverse([], result), do: result
  defp _reverse([h | t], result), do: _reverse(t, [h | result])


  def concat(l1, l2), do: reverse(l1) |> _concat(l2)

  defp _concat([], l2), do: l2
  defp _concat([h | t], l2), do: _concat(t, [h | l2])


  def flatten(list), do: _flatten(list, []) |> reverse

  defp _flatten([], result), do: result
  defp _flatten([h | t], result), do: _flatten(t, _flatten(h, result))
  defp _flatten(elem, result), do: [elem | result]


  def foldl([], acc, _func), do: acc
  def foldl([h | t], acc, func), do: foldl(t, func.(h, acc), func)

  def foldr(list, acc, func), do: list |> reverse |> foldl(acc, func)


  def map(list, func), do: reverse(list) |> _map(func, [])

  defp _map([], _func, result), do: result
  defp _map([h | t], func, result), do: _map(t, func, [func.(h) | result])


  def transpose(list), do: _transpose(list, nil)

  defp _transpose([], nil), do: []
  defp _transpose([], result), do: result |> map(&(&1 |> reverse))
  defp _transpose([h | t], nil), do: _transpose(t, map(h, &([&1])))
  defp _transpose([h | t], result), do: _transpose(t, _mprefix(h, result, []))

  defp _mprefix([], _matrix, result), do: result |> reverse
  defp _mprefix(_list, [], result), do: result |> reverse
  defp _mprefix([lh | lt], [mh | mt], result), do: _mprefix(lt, mt, [[lh | mh] | result])


  def zip(list), do: list |> transpose |> map(&(&1 |> :erlang.list_to_tuple))

  def unzip(list), do: list |> map(&(&1 |> :erlang.tuple_to_list)) |> transpose


  def keyfind(list, data, index, default \\ nil), do: _keyfind(list, data, index, default)

  def _keyfind([], _data, _index, default), do: default
  def _keyfind([tup | _tail], data, index, _default) when elem(tup, index) == data, do: tup
  def _keyfind([_tup | tail], data, index, default), do: _keyfind(tail, data, index, default)


  def keydelete(list, data, index), do: _keydelete(reverse(list), data, index, [])

  defp _keydelete([], _data, _index, result), do: result
  defp _keydelete([tup | tail], data, index, result) when elem(tup, index) == data,
      do: _keydelete(tail, data, index, result)
  defp _keydelete([tup | tail], data, index, result),
      do: _keydelete(tail, data, index, [tup | result])


  def keyreplace(list, data, index, replacement),
      do: _keyreplace(reverse(list), data, index, replacement, [])

  defp _keyreplace([], _data, _index, _replacement, result), do: result
  defp _keyreplace([tup | tail], data, index, replacement, result) when elem(tup, index) == data,
      do: _keyreplace(tail, data, index, replacement, [replacement | result])
  defp _keyreplace([tup | tail], data, index, replacement, result),
      do: _keyreplace(tail, data, index, replacement, [tup | result])


end
