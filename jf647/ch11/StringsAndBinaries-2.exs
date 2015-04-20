defmodule Ch11 do
  def anagram?(str1, str2) do
    same_length(str1, str2) and same_chars(str1, str2)
  end

  defp same_length(str1, str2), do: length(str1) == length(str2)

  defp same_chars(str1, str2), do: str1 -- str2 == []
end

IO.puts Ch11.anagram?('abc123', '321cba')

IO.puts Ch11.anagram?('abc123', 'def456')

IO.puts Ch11.anagram?('abc123', 'abc124')

IO.puts Ch11.anagram?('abc123', 'abc1234')
