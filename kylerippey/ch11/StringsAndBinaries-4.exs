defmodule Parse do
  def calculate(str), do: _calculate(str, 0)

  defp _calculate([], value), do: value
  defp _calculate([ digit | tail ], value) when digit in '0123456789', do: _calculate(tail, value*10 + digit - ?0)
  defp _calculate([ 32 | tail ], value), do: _calculate(tail, value)
  defp _calculate([ ?+ | tail ], value), do: value + _calculate(tail, 0)
  defp _calculate([ ?- | tail ], value), do: value - _calculate(tail, 0)
  defp _calculate([ ?* | tail ], value), do: value * _calculate(tail, 0)
  defp _calculate([ ?/ | tail ], value), do: value / _calculate(tail, 0)
end

IO.puts Parse.calculate('123 + 27') # => 150
IO.puts Parse.calculate('123 - 27') # => 96
IO.puts Parse.calculate('123 * 27') # => 3321
IO.puts Parse.calculate('123 / 27') # => 4.55555555