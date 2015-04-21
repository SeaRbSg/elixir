defmodule MyString do
  def center(dqs_list) do
    longest_word = Enum.max_by(dqs_list, &(String.length(&1))) 
    _center(dqs_list, String.length(longest_word))
  end

  defp _center([ head | tail], longest_word_length) do
    midpoint_of_longest = div(longest_word_length, 2)
    length_of_head = String.length(head)
    midpoint_of_head = div(length_of_head, 2)
    padding = (midpoint_of_longest - midpoint_of_head)
    IO.puts String.rjust(head,padding+length_of_head)
    _center(tail, longest_word_length)
  end

  defp _center([], _longest_word_length), do: [] 
end

MyString.center(["cat", "zebra", "elephant"])
