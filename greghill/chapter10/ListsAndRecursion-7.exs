defmodule Mylist do

  def span(from, to) when from == to, 
    do: []
  def span(from, to) when from < to, 
    do: [ from | span(from + 1, to)]
  def span(from, to) when from > to, 
    do: [ from | span(from - 1, to)]




  def all?([],_),             do: true
  def all?([head|tail], func) do
    if func.(head) do
      all?(tail,func)
    else
      false
    end
  end


  def primes_to(to) do
    request_range = span(2,to)
    for x <- request_range, is_prime?(x), do: x
  end


  # prime is if a number when divided by any number up to itself always leaves a remainder. 
  defp is_prime?(number), 
    do: all?(Enum.into(2..number-1,[]), &(rem(number,&1)!=0))
  


end


  




