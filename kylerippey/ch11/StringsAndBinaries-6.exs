defmodule MyString do
  def capitalize_sentences(str), do: _capitalize(String.next_codepoint(str), true)

  defp _capitalize(nil, _), do: []
  defp _capitalize({".", rest}, _), do: ["." | _capitalize(String.next_codepoint(rest), true)]
  defp _capitalize({" ", rest}, true), do: [" " | _capitalize(String.next_codepoint(rest), true)]
  defp _capitalize({codepoint, rest}, true), do: [String.upcase(codepoint) | _capitalize(String.next_codepoint(rest), false)]
  defp _capitalize({codepoint, rest}, false), do: [String.downcase(codepoint) | _capitalize(String.next_codepoint(rest), false)]
end

IO.puts MyString.capitalize_sentences("oh. a DOG. woof. ")