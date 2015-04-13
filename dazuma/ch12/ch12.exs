
# ControlFlow - 1

defmodule FizzBuzz do

  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  def fizzbuzz(n) do
    case n do
      n when rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
      n when rem(n, 3) == 0 -> "Fizz"
      n when rem(n, 5) == 0 -> "Buzz"
      n -> n
    end
  end

end


# ControlFlow-2

# The case statement is a bit clumsy, since we aren't really doing much pattern
# matching. I would consider cond strictly better than case for this function.
#
# It's a more difficult choice between cond and separate functions. The
# functions approach is more declarative and so probably more Elixir-like.
# However, it also suffers from not taking advantage of pattern matching,
# whereas cond seems made for this case.


# ControlFlow-3

defmodule Ok do

  def ok!({:ok, data}), do: data
  def ok!({:error, reason}) when is_binary(reason), do: raise reason
  def ok!({:error, reason}), do: raise inspect(reason)
  def ok!(unexpected), do: raise inspect(unexpected)

end
