prefix = fn prefix -> (fn suffix -> "#{prefix} #{suffix}" end) end
#=> #Function<6.90072148/1 in :erl_eval.expr/5>
mrs = prefix.("Mrs")
#=> #Function<6.90072148/1 in :erl_eval.expr/5>
mrs.("Smith")
#=> "Mrs Smith"
prefix.("Elixir").("Rocks")
#=> "Elixir Rocks"
