
defmodule MyList do


  # (Used by several other functions)
  def reverse(list), do: _reverse(list, [])
  defp _reverse([], result), do: result
  defp _reverse([h | t], result), do: _reverse(t, [h | result])


  # (From ListsAndRecursion-4)
  def span(from, to), do: _span(from, to, [])
  defp _span(from, to, result) when from > to, do: result
  defp _span(from, to, result), do: _span(from, to - 1, [to | result])


  # ListsAndRecursion-5

  def all?([], _func), do: true
  def all?([h | t], func), do: func.(h) and all?(t, func)

  def each([], _func), do: :ok
  def each([h | t], func) do
    func.(h)
    each(t, func)
  end

  # Tried to implement this without using "if", and using an accumulator so
  # tail recursion optimization will work.
  def filter(list, func), do: list |> _filter(func, []) |> reverse
  defp _filter([], _func, result), do: result
  defp _filter([h | t], func, result), do: _filter2(h, func.(h), t, func, result)
  defp _filter2(h, true, t, func, result), do: _filter(t, func, [h | result])
  defp _filter2(_h, false, t, func, result), do: _filter(t, func, result)

  # Implemented with tail recursion
  def split(list, index) when is_integer(index) and index >= 0 do
    {listl, listr} = _split([], list, index)
    {reverse(listl), listr}
  end
  defp _split(listl, listr, 0), do: {listl, listr}
  defp _split(listl, [], _index), do: {listl, []}
  defp _split(listl, [h | t], index), do: _split([h | listl], t, index - 1)

  # Implemented with tail recursion
  def take(list, index) when is_integer(index) and index >= 0,
      do: _take(list, index, []) |> reverse
  defp _take(_list, 0, result), do: result
  defp _take([], _index, result), do: result
  defp _take([h | t], index, result), do: _take(t, index - 1, [h | result])


  # ListsAndRecursion-6

  def flatten(list), do: _flatten(list, []) |> reverse

  defp _flatten([], result), do: result
  defp _flatten([h | t], result), do: _flatten(t, _flatten(h, result))
  defp _flatten(elem, result), do: [elem | result]


end


# ListsAndRecursion-7

defmodule Primes do

  def primes_upto(n) do
    for i <- MyList.span(2, n),
        MyList.all?(MyList.span(2, i-1), &(rem(i, &1) != 0)),
        do: i
  end

end


# ListsAndRecursion-8

defmodule Prag do

  def apply_tax(orders, tax_rates) do
    orders
      |> Enum.map(fn(order) ->
        [{:total_amount, _calc_total(order, tax_rates)} | order]
      end)
  end
  defp _calc_total(order, tax_rates) do
    rate = Keyword.get(tax_rates, order[:ship_to], 0.0)
    order[:net_amount] * (1.0 + rate)
  end

end
