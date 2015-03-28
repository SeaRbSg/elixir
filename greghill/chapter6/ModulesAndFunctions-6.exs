defmodule Chop do

  def guess(a,bottom..top) do
    correct?(a,top - divby2(top-bottom),bottom..top)
  end
  def correct?(a,guess,bottom..top) when a > guess do
    IO.puts "is it #{guess}?"
    guess(a,guess+1..top)
  end
  def correct?(a,guess,bottom..top) when a < guess do
    IO.puts "is it #{guess}?"
    guess(a,bottom..guess-1)
  end
  def correct?(a,guess,bottom..top) when a == guess do
    IO.puts "is it #{guess}?"
    IO.puts guess
  end
  def divby2(a) do
    div(a+1,2)
  end 
end








