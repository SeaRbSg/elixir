defmodule StringsAndBinaries do
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
