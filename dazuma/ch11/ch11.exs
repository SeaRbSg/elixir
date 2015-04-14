
defmodule MyStrings do

  # StringsAndBinaries-1

  def printable?([]), do: true
  def printable?([h | t]), do: h >= 32 and h <= 126 and printable?(t)


  # StringsAndBinaries-2

  def anagram?(s1, s2), do: length(s1) == length(s2) and s1 -- s2 == []


  # StringsAndBinaries-3

  # ['cat' | 'dog']
  #    == [[99, 97, 116] | [100, 111, 103]]
  #    == [[99, 97, 116], 100, 111, 103]
  #    == ['cat', 100, 111, 103]


  # StringsAndBinaries-4

  def calculate(expr) do
    {val1, [op | val2]} = Enum.split_while(expr, fn(x) -> x >= ?0 and x <= ?9 end)
    _calculate(List.to_integer(val1), op, List.to_integer(val2))
  end

  defp _calculate(val1, ?+, val2), do: val1 + val2
  defp _calculate(val1, ?-, val2), do: val1 - val2
  defp _calculate(val1, ?*, val2), do: val1 * val2
  defp _calculate(val1, ?/, val2), do: div(val1, val2)


  # StringsAndBinaries-5

  def center(list) do
    maxlen = list |> Enum.map(&String.length/1) |> Enum.max
    list |> Enum.each(fn(str) -> IO.puts(_cjust(str, maxlen)) end)
  end

  defp _cjust(str, new_length, padding \\ 32) do
    rlen = div(new_length + String.length(str), 2)
    str
      |> String.rjust(rlen, padding)
      |> String.ljust(new_length, padding)
  end


  # StringsAndBinaries-6

  def capitalize_sentences(str), do: _scase_start(str, <<>>)

  def _scase_start(<< " ", str::binary >>, result), do:
      _scase_start(str, << result::binary, " " >>)
  def _scase_start(<< ch::utf8, str::binary >>, result), do:
      _scase_mid(str, << result::binary, String.upcase(<< ch::utf8 >>)::binary >>)
  def _scase_start(<<>>, result), do: result

  def _scase_mid(<< ".", str::binary >>, result), do:
      _scase_start(str, << result::binary, "." >>)
  def _scase_mid(<< ch::utf8, str::binary >>, result), do:
      _scase_mid(str, << result::binary, String.downcase(<< ch::utf8 >>)::binary >>)
  def _scase_mid(<<>>, result), do: result


  # StringsAndBinaries-7

  def read_orders(path) do
    path
      |> File.stream!()
      |> Stream.drop(1)
      |> Stream.map(&_parse_line/1)
      |> Enum.to_list
  end

  defp _parse_line(line) do
    [id, ship_to, amount] = line
      |> String.split(",", trim: true)
      |> Enum.map(&String.strip/1)
    [
      id: id |> String.to_integer(),
      ship_to: ship_to |> String.replace(~r{^:}, "") |> String.to_atom(),
      net_amount: amount |> String.to_float()
    ]
  end

end
