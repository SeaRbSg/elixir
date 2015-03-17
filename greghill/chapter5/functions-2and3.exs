fizzler = fn 
  (a=0, b=0, _) ->
    IO.puts "test line 1"
    IO.puts "test line 2"
    IO.puts "test line 3"
    IO.puts "test line 4"
    "FizzBuzz"
  (a=0, _,   _) -> "Fizz"
  (_, b=0,   _) -> "Buzz"
  (_,   _,   c) -> c
end

buzzler = fn
  n -> fizzler.(rem(n,3), rem(n,5), n)
end

IO.puts buzzler.(10) #=> Buzz 
IO.puts buzzler.(11) #=> 11
IO.puts buzzler.(12) #=> Fizz
IO.puts buzzler.(13) #=> 13
IO.puts buzzler.(14) #=> 14
IO.puts buzzler.(15) #=> FizzBuzz
IO.puts buzzler.(16) #=> 16
IO.puts buzzler.(17) #=> 17