#Disclaimer: Totally got this from https://forums.pragprog.com/forums/322/topics/11982

defmodule Translate do
  defmacro explain(expression) do
    construct((quote do: unquote(expression[:do])))
  end

  def construct({operator, _meta, [left, right]}) 
    when (is_number left) and (is_number right) do
      "#{translate(operator)} #{left} and #{right}"
  end

  def construct({operator, _meta, [left, right]}) 
    when (is_number left) and not (is_number right) do
      "#{construct(right)}, then #{translate(operator, 2)} #{left}"
  end

  def construct({operator, _meta, [left, right]}) 
    when not (is_number left) and (is_number right) do
      "#{construct(left)}, then #{translate(operator)} #{right}"
  end

  def construct({operator, _meta, [left, right]}) do
    "#{construct(left)} and #{construct(right)}, then #{translate(operator)}"
  end

  @operators [ {:+, "add"}, 
               {:+, " to"},
               {:-, "subtract"}, 
               {:-, " from"},
               {:*, "multiply"}, 
               {:*, " by"},
               {:/, "devide"},
               {:/, " by"}     ]

  def translate(operator, appendix \\ 1)
  def translate(operator, appendix) when appendix == 2 do
    @operators |> Keyword.take([operator]) |> Keyword.values |> List.to_string
  end

  def translate(operator, _appendix) do
    {:ok, word} = Keyword.fetch(@operators, operator)
    word
  end
end

defmodule TestTranslate do
  require Translate

  IO.puts Translate.explain do: 1+2*3
  IO.puts Translate.explain do: 1+2*(3+4)
  IO.puts Translate.explain do: (1+2)*(3+4)
  IO.puts Translate.explain do: (1+2)*(3+4)/5
  IO.puts Translate.explain do: 1+2
  IO.puts Translate.explain do: 2*(1+2)
  IO.puts Translate.explain do: 5-4*(3+2)-1
  IO.puts Translate.explain do: (5-4)+(3+2)
end
