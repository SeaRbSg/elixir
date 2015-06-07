defmodule CommaFloatSigil do
  def sigil_v(lines, _opts) do
    lines
    |> String.rstrip
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, ","))) 
    |> Enum.map(&(custom_format_list(&1))) 
  end

  defp custom_format_list(list) do
    Enum.map(list, &(custom_format(Float.parse(&1), &1)))
  end

  defp custom_format({ number, _rest}, _string), do: number
  defp custom_format(_error, string), do: string
end

defmodule Example do
  import CommaFloatSigil

  def comma_seperated_lines do
    ~v"""
    1,2,3.14
    cat,dog
    """
  end
end

IO.inspect Example.comma_seperated_lines
