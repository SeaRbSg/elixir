IO.puts Enum.join Enum.map [1,2,3,4], &(&1 + 2)

Enum.each [1,2,3,4], &(IO.inspect &1)
