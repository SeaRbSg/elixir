defmodule Mylist do

  def  max(list),                                          do: _max(list, 0)
  def _max([],highest),                                    do: highest
  def _max([ head | tail ], highest) when head >= highest, do: _max(tail, head)
  def _max([ head | tail ], highest) when head < highest,  do: _max(tail, highest)

end
  