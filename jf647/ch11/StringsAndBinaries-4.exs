defmodule Ch11 do
  def simplecalc(str), do: _parse(str, 0)

  defp _parse([], value), do: value
  defp _parse([digit | tail], value) when digit in '0123456789' do
    _parse(tail, value*10 + (digit - ?0))
  end
  defp _parse([op | tail], value) when op in '+-/*' do
    _parse2(value, op, tail, 0)
  end

  defp _parse2(value, op, [], value2), do: _calc(value, op, value2)
  defp _parse2(value, op, [digit | tail], value2) when digit in '0123456789' do
    _parse2(value, op, tail, value2*10 + (digit - ?0))
  end

  defp _calc(value, ?+, value2), do: value + value2
  defp _calc(value, ?-, value2), do: value - value2
  defp _calc(value, ?*, value2), do: value * value2
  defp _calc(value, ?/, value2), do: value / value2
end

IO.puts Ch11.simplecalc('123+456')

IO.puts Ch11.simplecalc('123-456')

IO.puts Ch11.simplecalc('123*456')

IO.puts Ch11.simplecalc('123/456')
