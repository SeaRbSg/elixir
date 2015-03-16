prefix = fn p -> (fn name -> "#{p} #{name}" end) end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith") #=> "Mrs Smith"

IO.puts prefix.("Elixir").("Rocks") #=> "Elixir Rocks"