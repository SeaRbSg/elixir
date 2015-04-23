defmodule Issues.Formatter do

  def format(issues) do
    first_width = column_width("number", issues)
    last_width  = column_width("title",  issues)

    header(  first_width, last_width         )
    |> rows( first_width, last_width, issues )
  end

  def column_width(col, issues) do
    [first | _] = Enum.sort(issues, fn i1, i2 -> i1[col] > i2[col] end)
    first[col]
    |> maybe_to_string(col)
    |> String.length
  end

  defp maybe_to_string(val, "number"), do: Integer.to_string(val)
  defp maybe_to_string(val, "title" ), do: val

  def header(first_width, last_width) do
    String.ljust(" #", first_width + 1)    <> "| " <>
    String.ljust("created_at", 21)         <> "| " <>
    String.ljust("title", last_width)      <> "\n" <>
    String.duplicate("-", first_width + 1) <> "+-" <>
    String.duplicate("-", 21)              <> "+-" <>
    String.duplicate("-", last_width)      <> "\n"
  end

  def rows(header, first_width, last_width, issues) do
    Enum.reduce(issues, header,
      fn(issue, acc) -> acc <> row(first_width, last_width, issue) end )
  end

  def row(first_width, last_width, issue) do
    int_just(issue["number"], first_width + 1) <> "| " <>
    issue["created_at"] <> " | " <>
    int_just(issue["title"], last_width) <> "\n"
  end

  defp int_just(val, len) when is_integer(val) do
    Integer.to_string(val)
    |> String.ljust(len)
  end

  defp int_just(val, len) when is_binary(val) do
    String.ljust(val, len)
  end
end
