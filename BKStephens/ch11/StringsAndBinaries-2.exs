defmodule MyString do
  def anagram?(word1, word2), do: :lists.sort(word1) == :lists.sort(word2)
end
