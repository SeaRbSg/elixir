defmodule Parse do

  def capitalise_sentences(string) do
    string 
    |> String.split(".") 
    |> Enum.map_join(". ",&clean_element(&1))
  end
  def clean_element(word) do
    word 
    |> String.lstrip(?\s) 
    |> String.capitalize
  end
end