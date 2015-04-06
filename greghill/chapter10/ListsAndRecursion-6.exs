defmodule Mylist do

  #Version 1
  # def flatten([]), do: []
  # def flatten([head|tail]) when is_number(head) do
  #   [head|flatten(tail)]
  # end
  # def flatten([head|tail]) when is_list(head) do
  #   flatten(head) ++ flatten(tail)
  # end

  #VERSION 2
  def flatten([]),          do: []
  def flatten([head|tail]), do: flatten(head) ++ flatten(tail)
  def flatten(head),        do: [head]
  
  
  #flatten([ 1, [ 2, 3, [4] ], 5, [[[ 6]]]])

end
  

