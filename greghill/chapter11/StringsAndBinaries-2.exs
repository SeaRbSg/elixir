defmodule Strings do 

  #VERSION 1 - doesnt handle longer second word
  # def anagram?([],_), do: true 
  # def anagram?(word1, word2), do: _anagram?(word1, word2, word2)
  # def _anagram?(_,[],_), do: false
  # def _anagram?([h1|t1],[h2|t2], word2) when h1 == h2, do: anagram?(t1, word2)
  # def _anagram?(word1,[h2|t2], word2), do: _anagram?(word1, t2, word2)

  #VERSION 2 - some letter combinations could be considered the same
  # def anagram?(word1, word2), do: _count(word1,0) == _count(word2,0)
  # def _count([], total), do: total  
  # def _count([h1|t1],total), do: _count(t1,total+h1) 

  #VERSION 3 - this uses a library function which feels a bit like cheating. 
  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

end
