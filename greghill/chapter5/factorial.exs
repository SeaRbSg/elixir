#This should product a factorial of a passed number. 
fl = fn
  (0, _)  -> 1 
  (1, _)  -> 1
  (n,nfl) -> n * nfl.(n - 1, nfl)
end

IO.puts fl.(5, fl)