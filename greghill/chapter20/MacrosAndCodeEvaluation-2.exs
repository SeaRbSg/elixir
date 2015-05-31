defmodule Times do
  defmacro times_n(number) do
    function_name = String.to_atom("times_#{number}")
    quote do
      def unquote(function_name)(multiply_by) do
        unquote(number) * multiply_by
      end
    end
  end
end

 defmodule Test do
   require Times
   Times.times_n(3)
   Times.times_n(4)
 end

 IO.puts Test.times_3(4)   #=> 12
 IO.puts Test.times_4(5)

 # why does this work?
# when it doesn't in iex:
# iex(1)> defmodule Name, do: (def :atom_name, do: 1+2)
# ** (CompileError) iex:1: invalid syntax in def :atom_name
#     (elixir) src/elixir_def.erl:44: :elixir_def.store_definition/6
#     (elixir) src/elixir_compiler.erl:126: :elixir_compiler.dispatch_loaded/6
#     (elixir) src/elixir_module.erl:141: :elixir_module.eval_form/6
#     (elixir) src/elixir_module.erl:57: :elixir_module.do_compile/5
#     (elixir) src/elixir_lexical.erl:16: :elixir_lexical.run/3
# or

# defmodule Name do
#   def :atom_name do
#     a = 1+2
#   end
# end

# => elixir test_functionname.s s
# ** (CompileError) test_functionname.exs:2: invalid syntax in def :atom_name
#     (elixir) src/elixir_def.erl:44: :elixir_def.store_definition/6
#     (stdlib) erl_eval.erl:657: :erl_eval.do_apply/6

