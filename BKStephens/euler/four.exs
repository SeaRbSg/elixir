defmodule Four do
  def calculate, do: palindrome_products(100, 999) |> Enum.max
  
  def palindrome_products(min, max) do
    for x <- min..max,
        y <- x..max,
        is_palindrome?(x * y),
        do: [x * y]
  end

  def is_palindrome?(n), do: to_string(n) == String.reverse(to_string(n))
end
