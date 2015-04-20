defmodule Ch11 do
  def printable?([]), do: true
  def printable?([head | tail]) do
    printable_char?(head) && printable?(tail)
  end

  defp printable_char?(ch)
    # not sure how to use ? with space
    when ch >= 32 and ch <= ?~, do: true

  defp printable_char?(_), do: false
end

IO.puts Ch11.printable?('abcde')

IO.puts Ch11.printable?('abc¡£¢')
