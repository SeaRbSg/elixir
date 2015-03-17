# Solution to Daniel's challenge #4

coutdown_recursive = fn
  0, _ -> "blast off!"
  i, f -> "#{i}, #{f.(i-1, f)}"
end

countdown = fn
  i -> IO.puts coutdown_recursive.(i, coutdown_recursive)
end

countdown.(10)