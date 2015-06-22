defmodule CommaParseSigil do
  def sigil_v(lines, _opts) do
    lines 
    |> String.rstrip
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x,",") end)
  end

  
end

defmodule Example do
  import CommaParseSigil

  def lines do
    ~v"""
    1,2,3
    cat,dog
    """
  end
end

IO.inspect Example.lines