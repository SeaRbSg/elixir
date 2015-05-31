defmodule My do
  defmacro myunless(condition,clauses) do
    dont_clause   = Keyword.get(clauses, :do, nil)
    quote do 
      if ! unquote(condition), do: unquote(dont_clause)
    end
  end
end

defmodule Test do
  require My
  
  My.myunless 1==2 do
    IO.puts "one doesn't equal 2" 
  end
end