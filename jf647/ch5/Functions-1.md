# Part 1

list_concat = fn a, b -> a ++ b end

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> list_concat = fn a, b -> a ++ b end
#Function<12.90072148/2 in :erl_eval.expr/5>
iex(2)>
nil
iex(3)> list_concat.([:a, :b], [:c, :d])
[:a, :b, :c, :d]
```

# Part 2

sum = fn a, b, c -> a + b + c end

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> sum = fn a, b, c -> a + b + c end
#Function<18.90072148/3 in :erl_eval.expr/5>
iex(2)> sum.(1,2,3)
6
iex(3)>
```

# Part 3

pair_tuple_to_list = fn { a, b } -> [ a, b ] end

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> pair_tuple_to_list = fn { a, b } -> [ a, b ] end
#Function<6.90072148/1 in :erl_eval.expr/5>
iex(2)> pair_tuple_to_list.( { 1234, 5678 } )
[1234, 5678]
iex(3)>
```
