defmodule FizzBuzz do
  
  def upto(n) when n > 0, do: _upto(1,[],n)


  def _upto(_,result,0), do: Enum.reverse(result)

  def _upto(current,result,left) do    
    IO.puts "Checking #{current}"
    thisresult = case {rem(current,3),rem(current,5)} do 
      {0,0} -> "fizzbuzz" 
      {0,_} -> "fizz"
      {_,0} -> "buzz"      
      _     -> current
    end
    IO.inspect thisresult
    _upto(current+1, [ thisresult | result] , left-1 )
  end
end