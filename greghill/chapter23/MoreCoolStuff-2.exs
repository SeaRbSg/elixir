defmodule CommaParseSigil do
  def sigil_v(lines, _opts) do
    lines
    |> String.rstrip
    |> String.split("\n")
    |> Enum.map(&process_line(&1))
  end

  def process_line(line) do
    String.split(line,",")
    |> Enum.map(&convert_to_float(&1))
  end

  def convert_to_float(string) do
    case Float.parse(string) do
      :error -> string
      {x,""} -> x
      _      -> string
    end
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
end

IO.inspect Example.lines