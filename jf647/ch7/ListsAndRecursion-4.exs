defmodule Ch7Ex4 do
  def span(from, to) when from < to do
    [ from | span(from + 1, to) ]
  end
  def span(from, _) do
    [ from ]
  end
end

IO.puts Ch7Ex4.span(300,500) |> Enum.join(", ")
