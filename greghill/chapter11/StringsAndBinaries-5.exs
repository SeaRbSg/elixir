defmodule Parse do

  def centre (wordlist) do
    wordlist
    |> Enum.reduce(0,&(Enum.max([String.length(&1),&2]))) 
    |> _align(wordlist)
  end

  def _align(_,[]),         do: []
  def _align(longest,[h|t]) do
    this_word_len = String.length(h) 
    IO.inspect String.rjust(h,div(longest - this_word_len,2) + this_word_len)
    _align(longest,t)
  end

end