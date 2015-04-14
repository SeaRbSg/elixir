defmodule MyString do
  @operations %{
    ?+ => &(&1 + &2),
    ?- => &(&1 - &2),
    ?/ => &(&1 / &2),
    ?* => &(&1 * &2)
  }

  def calculate(expression) do
    #Split the string the first time +-* or / is found  
    { left, rest } = Enum.split_while(expression, &(!(&1 in '+-*/')))
    [ operator | right ] = rest  
    @operations[operator].(to_int(left), to_int(right))    
  end
  
  defp to_int(sqs), do: ~w(#{sqs}) |> List.first |> String.to_integer
end
