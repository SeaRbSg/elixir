defmodule MyString do
  def capitalize_sentences(str) do
    _capitalize(str, true, "") 
  end

  def _capitalize(<<>>, _capitalize_head, accum), do: accum

  def _capitalize(<< char :: utf8, str :: binary >>, capitalize_char?, accum) do 
    my_char = to_string [char]
    
    transformed_char = case capitalize_char? do
      true -> String.upcase(my_char)
      false -> String.downcase(my_char)
    end
    
    capitalize_next_char? = case my_char do
      "." -> true
      " " -> capitalize_char?
      _   -> false 
    end
    
    _capitalize(str, capitalize_next_char?, accum <> transformed_char)
  end
end

IO.puts MyString.capitalize_sentences("oh. a DOG. woof. ")
#"Oh. A dog. Woof."
