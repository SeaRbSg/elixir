defmodule MyList do
  def caesar([], _), do: []
  def caesar([ head | tail], n), do: [ addn(head, n) | caesar(tail, n)]

  defp addn(char, n) when char + n > ?z, do: addn(?a, (char+n)-(?z+1))
  defp addn(char, n), do: char + n
end