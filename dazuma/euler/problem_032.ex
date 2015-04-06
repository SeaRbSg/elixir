defmodule Euler032 do

  def permutation(_list, 0), do: [[]]
  def permutation(list, num), do:
    (for elem <- list, rest <- permutation(list -- [elem], num - 1), do: [elem | rest])

  def main() do
    import List, only: [to_integer: 1]
    import Enum
    digits = '123456789'
    permutation(digits, 4)
      |> map(fn(front) ->
        product = to_integer(front)
        permutation(digits -- front, 5) |> find_value(0, fn (back) ->
          if (back |> take(1) |> to_integer) * (back |> drop(1) |> to_integer) == product or
             (back |> take(2) |> to_integer) * (back |> drop(2) |> to_integer) == product,
             do: product, else: false
        end)
      end)
      |> sum
  end

end

Euler032.main |> IO.puts

# Runtime: 0.58s
