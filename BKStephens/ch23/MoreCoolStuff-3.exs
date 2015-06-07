defmodule CommaFloatSigil do
  def sigil_v(lines, _opts) do
   [ head | tail] = lines
                  |> String.rstrip
                  |> String.split("\n")

    header = String.split(head, ",")

    list_of_lists = tail
                  |> Enum.map(&(String.split(&1, ","))) 
                  |> Enum.map(&(custom_format_list(&1))) 

    Enum.map(list_of_lists, &(Enum.zip(header,&1)))
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
    Item,Qty,Price
    Teddy bear,4,34.95
    Milk,1,2.99
    Battery,6,8.00
    """
  end
end

IO.inspect Example.comma_seperated_lines
