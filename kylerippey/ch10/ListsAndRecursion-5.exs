defmodule MyEnum do
  # all?
  def all?([], _func), do: true
  def all?([ head | tail ], func), do: _all?(tail, func, func.(head))

  defp _all?([], _func, value), do: value

  defp _all?([ head | tail ], func, true), do: _all?(tail, func, func.(head))
  defp _all?([ _ | _ ], _func, false), do: false


  # each
  def each([], _func), do: nil
  def each([ head | tail ], func) do
    func.(head)
    each(tail, func)
  end

  # filter
  def filter([], _func), do: []
  def filter([ head | tail ], func), do: _filter([ head | tail ], func, func.(head))

  defp _filter([ head | tail ], func, true), do: [head] ++ filter(tail, func)
  defp _filter([ _head | tail ], func, false), do: filter(tail, func)


  # split (does not work with negative length)
  def split(list, len), do: _split([], list, len)
  defp _split(list1, list2, 0), do: {list1, list2}
  defp _split(list1, [head2 | tail2], len) when len > 0, do: _split(list1 ++ [head2], tail2, len-1)
  defp _split(list1, [], _len), do: _split(list1, [], 0)

  # take (does not work with negative length)
  def take([], _), do: []
  def take(_list, 0), do: []
  def take([ head | tail ], len) when len > 0, do: [ head | take(tail, len-1) ]
end