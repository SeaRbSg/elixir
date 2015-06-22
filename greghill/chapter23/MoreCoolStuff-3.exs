defmodule CommaParseSigil do
  def sigil_v(lines, 'h') do
    [header | line_list] = lines 
                           |> String.rstrip
                           |> String.split("\n")

    header_list = String.split(header,",")    

    line_list
    |> Enum.map(&add_head_to_item(String.split(&1,","), header_list))
  end

  def sigil_v(lines, _opts) do
    lines 
    |> String.rstrip
    |> String.split("\n")
    |> Enum.map(&(String.split(&1,",")))
  end

  def add_head_to_item([],[]), do: []
  def add_head_to_item([item_1 | rest_of_line], [header_1 | rest_of_headers]) do 
    [{String.to_atom(header_1),item_1} | add_head_to_item(rest_of_line,rest_of_headers)]
  end
end


defmodule Example do
  import CommaParseSigil

  def lines do
    ~v"""
    1,2,3.14
    cat,dog
    mouse,3.2door
    """
  end

  def lines_header do
    ~v"""
    Item,Quantity,Price
    Teddy bear,4,34.95
    milk,2,4.50
    drugs,2,200.00
    """h
  end
end

IO.inspect Example.lines
IO.inspect Example.lines_header

# => [["1", "2", "3.14"], ["cat", "dog"], ["mouse", "3.2door"]]
# => [[Item: "Teddy bear", Quantity: "4", Price: "34.95"],
# =>  [Item: "milk", Quantity: "2", Price: "4.50"],
# =>  [Item: "drugs", Quantity: "2", Price: "200.00"]]