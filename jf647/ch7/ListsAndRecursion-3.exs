defmodule Ch7Ex3 do
  def caesar(list, n) do
    _map(list, fn
      c when c+n > 122 -> c+n-26
      c                -> c+n
    end)
  end
  defp _map([], _func), do: []
  defp _map([head | tail], func), do: [ func.(head) | _map(tail, func) ]
end

IO.puts Ch7Ex3.caesar('abcde', 1)
IO.puts Ch7Ex3.caesar('vwxyz', 5)
IO.puts Ch7Ex3.caesar('ryvkve', 13)
