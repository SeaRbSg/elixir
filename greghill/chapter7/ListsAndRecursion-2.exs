defmodule Mylist do

  def  max([head|tail]),                                    do: _max(tail, head)
  defp _max([],highest),                                    do: highest
  defp _max([ head | tail ], highest) when head >= highest, do: _max(tail, head)
  defp _max([ head | tail ], highest) when head < highest,  do: _max(tail, highest)

end
  