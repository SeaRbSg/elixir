defmodule MyList do
  def max([]), do: nil
  def max([ head | tail ]), do: _max(tail, head)

  defp _max([], maxvalue), do: maxvalue
  defp _max([ head | tail ], maxvalue) when head < maxvalue, do: _max(tail, maxvalue)
  defp _max([ head | tail ], maxvalue) when head >= maxvalue, do: _max(tail, head)
end