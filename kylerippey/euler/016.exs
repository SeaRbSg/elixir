defmodule Powersum do
  def sum(x, y), do: digit_sum(round(:math.pow(x,y)))

  # private
  defp digit_sum(0), do: 0
  defp digit_sum(value), do: rem(value, 10) + digit_sum(div(value, 10))
end

IO.puts Powersum.sum(2, 1000)