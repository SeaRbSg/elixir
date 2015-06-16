defmodule Tracer do
  #TODO: ensure the 'guard' variable displays correctly in dump_defn

  def dump_args(args) do
    IO.inspect args
    args |> Enum.map(&inspect/1) |> Enum.join(", ")
  end

  def dump_defn(name, args) do
    # functioname(1,2,3,)
    "#{name}(#{dump_args(args)})"
  end

  def dump_gaurd_defn(name, args, gtype, clause) do 
    # functioname(1,2,3,) when clause
    "#{name}(#{dump_args(args)}) #{gtype} #{clause}"
  end

  defmacro def(definition={gtype, _, [{name,_,args}, guard]},  do: content) do
    IO.inspect guard
    quote do
      Kernel.def(unquote(definition)) do
        IO.puts "==> call:   #{Tracer.dump_gaurd_defn(unquote(name), unquote(args), unquote(gtype), unquote(guard))}"
        result = unquote(content)
        IO.puts "<== result: #{result}"
        result
      end
    end
  end

  defmacro def(definition={name,_,args}, do: content) do
    quote do
      Kernel.def(unquote(definition)) do
        IO.puts "==> call:   #{Tracer.dump_defn(unquote(name), unquote(args))}"
        result = unquote(content)
        IO.puts "<== result: #{result}"
        result
      end
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [def: 2]
      import unquote(__MODULE__), only: [def: 2]
    end
  end
end

defmodule Test do
  use Tracer
  def puts_sum_three(a,b,c), do: IO.inspect(a + b + c)
  def add_list(list),        do: Enum.reduce(list, 0, &(&1 + &2))
  def sub_one_from_other(one,other) when one < other, do: other - one
end

Test.puts_sum_three(1,2,3)
Test.add_list([5,6,7,8])
Test.sub_one_from_other(2, 10)
