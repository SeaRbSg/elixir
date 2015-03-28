defmodule Mylist do

  def ceasar([],_addition),              
    do: []
  def ceasar([ head | tail ], addition) when (head + addition) > 122, 
    do: [ 96 + ((head + addition) - 122 ) | ceasar(tail, addition)]
  def ceasar([ head | tail ],addition),  
    do: [head + addition | ceasar(tail, addition)]

end

# 114 'r' 
# 122 'z'