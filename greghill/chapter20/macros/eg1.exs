defmodule My do 
  defmacro macro(code) do 
    IO.inspect code
    quote do: IO.puts "different code"
  end
end

defmodule Test do
  require My
  My.macro(IO.puts("Hello"))
end
