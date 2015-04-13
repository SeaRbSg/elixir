defmodule MyString do
  def center(list), do: _center(list, longest_string(list))

  defp _center([], _longest), do: :ok
  defp _center([ head | tail ], longest) do
    leading = div(longest - String.length(head), 2)
    IO.puts(String.rjust(head, String.length(head) + leading))
    _center(tail, longest)
  end

  defp longest_string(list), do: Enum.max(string_lengths(list))
  defp string_lengths(list), do: Enum.map(list, fn(x) -> String.length(x) end)
end

# iex(1)> MyString.center(["1","123", "12345","1234567","123456789"])
#     1
#    123
#   12345
#  1234567
# 123456789
# :ok