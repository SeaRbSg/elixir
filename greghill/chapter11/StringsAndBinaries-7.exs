defmodule Parse do

  def csv(filename) do
    file = File.open!(filename)
    headers = file
    |> IO.read(:line) 
    |> String.rstrip
    |> line_to_list

    file
    |> IO.stream(:line)
    |> Enum.map(&convert_to_keyword_list(line_to_list(&1),headers))
  end

  def convert_to_keyword_list([],[]), do: []
  def convert_to_keyword_list([first_value|rest_values], [first_header | rest_headers]) do
    [{String.to_atom(first_header),value_convert(first_value)} | convert_to_keyword_list(rest_values,rest_headers)]
  end

  def value_convert(<< ":", value::binary >> ) do
    String.to_atom(value) 
  end
  def value_convert(string) do
    cond do
    Regex.match?(~r/^\d+\.{1}\d+$/,string) ->
      String.to_float(string)
    Regex.match?(~r/^\d+$/,string) ->
      String.to_integer(string)
    true->
      string
    end
  end

  def line_to_list(line) do
    line
    |> String.rstrip
    |> String.split(",")
  end
end