```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> fizzbuzz = fn
...(1)>   0, 0, _ -> "FizzBuzz"
...(1)>   0, _, _ -> "Fizz"
...(1)>   _, 0, _ -> "Buzz"
...(1)>   _, _, c -> c
...(1)> end
#Function<18.90072148/3 in :erl_eval.expr/5>
iex(2)> fizzbuzz.(0,0,0)
"FizzBuzz"
iex(3)> fizzbuzz.(0,1,0)
"Fizz"
iex(4)> fizzbuzz.(1,0,0)
"Buzz"
iex(5)> fizzbuzz.(1,1,0)
0
iex(6)> fizzbuzz.(1,1,5)
5
```
