defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    case n do
      n when rem(n, 3) == 0 and rem(n, 5) == 0 ->
        "FizzBuzz"
      n when rem(n, 3) == 0 ->
        "Fizz"
      n when rem(n,5) == 0 ->
        "Buzz"
      n ->
        n
    end
  end

  # I feel like the multimethod and the case strategies are effectively equivalent,
  # at least the way I did them

  # However, I like the multimethod implementation the best.

  # I like it because it forces me to think declaratively instead of imperatively
  # The cond and the case implementations can both be read as a sort of "do this
  # then do that then do the other". "Check rem 15, then check rem 5, then check rem 3"

  # The multimethod implementation, by hijacking my conception of functions,
  # forces me to think in terms of identities and referential transparencies:
  # "fizzbuzz(n) is Fizz when n % 3 == 0" instead of "Check if n%3 is zero"
end

defmodule ControlFlow do
  def ok!({:ok, data}) do
    data
  end

  def ok!({:error, data}) do
    raise inspect(data)
  end
end
