fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

fb = fn n -> fizzbuzz.(rem(n,3), rem(n,5), n) end

IO.puts fb.(10)
IO.puts fb.(11)
IO.puts fb.(12)
IO.puts fb.(13)
IO.puts fb.(14)
IO.puts fb.(15)
IO.puts fb.(16)