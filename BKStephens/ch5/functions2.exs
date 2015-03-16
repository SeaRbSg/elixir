fizz_buzz = fn
   0, 0, _ -> "FizzBuzz"
   0, _, _ -> "Fizz"
   _, 0, _ -> "Buzz"
   _, _, c -> c
end

IO.puts fizz_buzz.(0,1,3)
IO.puts fizz_buzz.(0,0,0)
IO.puts fizz_buzz.(1,0,0)
IO.puts fizz_buzz.(1,1,5)
