defmodule StringsAndBinaries do

  def is_printable?([h|t]) do
    is_printable?(h) && is_printable?(t)
  end

  def is_printable?(c) when is_integer(c) and c >= 32 and c < 127 do
    true
  end

  def is_printable?([]) do
    true
  end

  def is_printable?(_) do
    false
  end

  def in_printable_ascii?(c) when is_integer(c) and c >= 32 and c < 127 do
    true
  end

  def in_printable_ascii?(_) do
    false
  end

  def enum_is_printable?(str) when is_list(str) do
    Enum.all?(str,
      fn (x, acc) -> acc && in_printable_ascii?(x) end
    )
  end

  def enum_is_printable?(_) do
    false
  end

  def anagram?(word1, word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  #   [ 'cat' | 'dog' ]
  # ==> ['cat', 100, 111, 103]

  # WHHYYYY!?!?!?!

  # Why? LRN2CONS DUMPASS

  # the | operator takes whatever *value* is on the LHS
  # and puts it at the front of the *list* that is on the RHS
  # 'cat' and 'dog' are both lists.
  # Elixir dutifully puts the *value* 'cat' on the front
  # of the *list* 'dog', giving us something kind of like this:

  # [ ['c', 'a', 't']. 'd', 'o', 'g']

  # The only reason it looks funky is because elixir sees a
  # top level list with 4 elements, only three of which are printable
  # and concludes the list unprintable as ascii

  def to_i(str) do
    {rtn, _} = :string.to_integer(str)
    rtn
  end

  def calculate(string) do
    {num1, num2, op} = preprocess
  end

  def preprocess(string, chr) do
    {num1, num2, op} = _preprocess([], string, chr)
    {to_i(num1), to_i(num2), op}
  end

  # accumulation in pre inverts the number
  def _preprocess(pre, [chr|str], chr) do
    {Enum.reverse(pre), str, chr}
  end

  def _preprocess(pre, [h|str], chr) do
    _preprocess([h | pre], str, chr)
  end


  def center(arr) do

    width = Enum.max_by(arr, fn (elem) -> String.length(elem) end) |> String.length

    Enum.each(arr, fn(arr) -> print_center(arr, width) end)
  end

  def print_center(str, width) do
    padding = width - String.length(str)
    padl = div(padding, 2)
    padr = case rem(padding, 2) do
      0 ->
        padl
      1 ->
        padl + 1
      _ ->
        raise "Math is broken"
    end

    IO.puts "#{String.duplicate(" ", padl)}#{str}#{String.duplicate(" ", padr)}"
  end

  def capitalize_sentences(str) do
    # clean it up
    dc = String.downcase(str)

    capitalize(dc, "")
  end

  defp capitalize(<< head :: utf8, tail :: binary >>, acc) do
    char = to_dqs(head)
    case char == " " do
      true ->
        capitalize(tail, acc <> char)
      false ->
        find_period(tail, acc <> String.upcase(char))
    end
  end
  defp capitalize(<<>>, acc) do
    acc
  end

  defp find_period(<< head :: utf8, tail :: binary>>, acc) do
    char = to_dqs(head)
    case char == "." do
      true ->
        capitalize(tail, acc <> char)
      false ->
        find_period(tail, acc <> char)
    end
  end
  defp find_period(<<>>, acc) do
    acc
  end

  defp to_dqs(cp) do
    to_string([cp])
  end

end
