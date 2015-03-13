fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end
thingy = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> fizzbuzz = fn
...(1)>   0, 0, _ -> "FizzBuzz"
...(1)>   0, _, _ -> "Fizz"
...(1)>   _, 0, _ -> "Buzz"
...(1)>   _, _, c -> c
...(1)> end
#Function<18.90072148/3 in :erl_eval.expr/5>
iex(2)> thingy = fn n -> fizzbuzz rem(n, 3), rem(n, 5), n end
#Function<6.90072148/1 in :erl_eval.expr/5>
iex(5)> thingy.(10)
"Buzz"
iex(6)> thingy.(11)
11
iex(7)> thingy.(12)
"Fizz"
iex(8)> thingy.(13)
13
iex(9)> thingy.(14)
14
iex(10)> thingy.(15)
"FizzBuzz"
iex(11)> thingy.(16)
16
iex(12)> thingy.(17)
17
```
