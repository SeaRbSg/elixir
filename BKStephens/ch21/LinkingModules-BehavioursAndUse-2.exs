defmodule Tracer do
  
  def dump_args(args) do
    args |> Enum.map(&inspect/1) |> Enum.join(", ")
  end

  def dump_defn(name, args) do
    "#{name}(#{dump_args(args)})"
  end

 defmacro def(definition={name,_,args}, do: content) do
  quote do
    Kernel.def(unquote(definition)) do
      IO.puts """
      #{IO.ANSI.default_color}\
      --> call: \
      #{IO.ANSI.yellow}\
      #{Tracer.dump_defn(unquote(name), unquote(args))}\
      #{IO.ANSI.default_color}\
      """

      result = unquote(content)
      IO.puts "<-- result: #{IO.ANSI.red}#{IO.ANSI.underline}#{result}#{IO.ANSI.default_color}#{IO.ANSI.no_underline}"
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
  def puts_sum_three(a,b,c), do: IO.inspect(a+b+c)
  def add_list(list),        do: Enum.reduce(list, 0, &(&1+&2))
end

Test.puts_sum_three(1,2,3)
Test.add_list([5,6,7,8])
