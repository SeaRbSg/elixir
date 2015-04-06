defmodule Mylist do
  
  def all?([],_),             do: true
  def all?([head|tail], func) do
    if func.(head) do
      all?(tail,func)
    else
      false
    end
  end


  def each([],_),              do: []

  def each([head|tail], func), do: [func.(head)|each(tail,func)]
 

  def filter([],_),             do: []

  def filter([head|tail], func) do
    if func.(head) do
      [head|filter(tail,func)]
    else
      filter(tail,func)
    end
  end
 

  def split(list, count),     do: _splitcount(list, count, [])
  defp _splitcount([], _, _), do: []
  defp _splitcount([head|tail], count, firstpart) when count > 0, 
    do: _splitcount(tail, count-1,[ head | firstpart ])
  defp _splitcount(list, count, firstpart) when count  <= 0,
    do: { reverse(firstpart), list }
  
  
  def reverse([]), do: []
  def reverse([ head | tail ]), do: reverse(tail) ++ [head]

  
  def take(_list,count) when count==0, do: []
  def take([head|tail],count), do: [head|take(tail,count-1)] 


end
  

