fizz_buzz = fn
   0, 0, _ -> "FizzBuzz"
   0, _, _ -> "Fizz"
   _, 0, _ -> "Buzz"
   _, _, c -> c
end

rem_buzz = fn
  n -> fizz_buzz.(rem(n,3), rem(n,5), n)
end

IO.puts rem_buzz.(10)
IO.puts rem_buzz.(11)
IO.puts rem_buzz.(12)
IO.puts rem_buzz.(13)
IO.puts rem_buzz.(14)
IO.puts rem_buzz.(15)
IO.puts rem_buzz.(16)
