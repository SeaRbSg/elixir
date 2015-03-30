defmodule MyList do
  def caesar([], _), do: []
  def caesar([ head | tail ], chars_ahead) 
    when head+chars_ahead > ?z,
    do: caesar([ head-26| tail ], chars_ahead)
  def caesar([ head | tail ], chars_ahead), 
    do: [ head+chars_ahead | caesar(tail, chars_ahead) ]
end
