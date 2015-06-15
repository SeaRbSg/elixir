defmodule Englishify do
  require ExUnit
#when operator in @operator 

  @operator [:+, :*, :-, :/]
  defmacro arithmetic({operator, _, [left, right]} = expr) do
     IO.puts "Expr: #{inspect expr}"
    # IO.puts "Operator: #{inspect operator}"
    # IO.puts "Left: #{inspect left}"
    # IO.puts "Right: #{inspect right}"


    translate(expr)
    
  end

  defp translate({operator, _, [left, right]}) when is_tuple left  do
    translate(left) <> ", then " <> to_words({operator, right})
  end

  defp translate({:+, _, [left, right]}), do: "Add #{left} to #{right}"
  defp translate({:-, _, [left, right]}), do: "Subtract #{left} from #{right}"
  defp translate({:*, _, [left, right]}), do: "Multiply #{left} by #{right}"
  defp translate({:/, _, [left, right]}), do: "Divide #{left} by #{right}"


  defp to_words({:+, number}), do: "add #{number}"
  defp to_words({:-, number}), do: "subtract #{number}"
  defp to_words({:*, number}), do: "multiply by #{number}"
  defp to_words({:/, number}), do: "divede by #{number}"

end


defmodule Test do
  require Englishify

  IO.puts Englishify.arithmetic 2 + 2 - 5 + 3 
  IO.puts Englishify.arithmetic 2 * 2
  IO.puts Englishify.arithmetic 2 - 1 + 3 
  
end