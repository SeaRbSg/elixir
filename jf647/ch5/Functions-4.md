prefix = fn
  pre -> fn
    suf -> "#{pre} #{suf}"
  end
end

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> prefix = fn
...(1)>   pre -> fn
...(1)>     suf -> "#{pre} #{suf}"
...(1)>   end
...(1)> end
#Function<6.90072148/1 in :erl_eval.expr/5>
iex(2)> mrs = prefix.("Mrs")
#Function<6.90072148/1 in :erl_eval.expr/5>
iex(3)> mrs.("Smith")
"Mrs Smith"
iex(4)> prefix.("Elixir").("Rocks")
"Elixir Rocks"
```
