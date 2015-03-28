defmodule Chop do

  def guess(a,bottom..top) do
    correct?(a,top - divby2(top-bottom),bottom..top)
  end
  defp _guess(a,guess,_bottom..top) when a > guess do
    IO.puts "is it #{guess}?"
    guess(a,guess+1..top)
  end
  defp _guess(a,guess,bottom.._top) when a < guess do
    IO.puts "is it #{guess}?"
    guess(a,bottom..guess-1)
  end
  defp _guess(a,guess,_bottom.._top) when a == guess do
    IO.puts "is it #{guess}?"
    IO.puts guess
  end
  defp divby2(a) do
    div(a+1,2)
  end 
end








