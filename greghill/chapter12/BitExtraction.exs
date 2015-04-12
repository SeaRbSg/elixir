defmodule Bit do
  def extract(<< sign::size(1), exp::size(11), mantissa::(52)>>) do 
    IO.inspect sign
    IO.inspect exp
    IO.inspect mantissa
  end
end

Bit.extract(<< 3.14159::float >>)  