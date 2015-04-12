defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from+1, to)]

  def primes(n) when n > 1 do
    for x <- span(2, n), is_prime?(x), do: x
  end

  def is_prime?(n), do: _is_prime?(n, 2)
  defp _is_prime?(n, cur) when cur > div(n, 2), do: true
  defp _is_prime?(n, cur) when rem(n, cur) == 0, do: false
  defp _is_prime?(n, cur), do: _is_prime?(n, cur+1)
end