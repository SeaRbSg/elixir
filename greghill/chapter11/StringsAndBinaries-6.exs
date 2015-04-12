defmodule Parse do

  def capitalise_sentences(string) do
    string 
    |> String.split(".") 
    |> Enum.map_join(". ",&clean_word(&1))
  end
  def clean_word(word) do
    word 
    |> String.lstrip(?\s) 
    |> String.capitalize
  end
end