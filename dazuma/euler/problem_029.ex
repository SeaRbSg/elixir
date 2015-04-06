defmodule Euler029 do

  def pow(a, b), do: pow(a, b, 1)
  def pow(_a, 0, c), do: c
  def pow(a, b, c), do: pow(a, b-1, c*a)

  def main() do
    (for a <- 2..100, b <- 2..100, do: pow(a, b), into: HashSet.new) |> Enum.count
  end

end

Euler029.main |> IO.puts

# Runtime: 0.30s
