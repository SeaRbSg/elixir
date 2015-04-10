defmodule Strings do 

  def is_printable?(str)         when is_list(str) == false, 
    do: raise "Passed parameter not a list"
  def is_printable?([head | _ ]) when head > ?~ or head < ?\s, 
    do: false
  def is_printable?([ _ | tail]), 
    do: is_printable?(tail)
  def is_printable?([]), 
    do: true

end
