defmodule Conditions.TableFormatter do
 def print_table_rows(data,columns_to_print) do 
    columns_to_print 
    |> Enum.map(&(get_value(&1,data)))
    |> print_data(columns_to_print)

    
  end


  def get_value(value,xml) do
    {node, _} = xml |>  Exmerl.XPath.find("//current_observation/#{value}/text()")
    [node_element] = node
    {_, _,_,_,value,_} = node_element
    value
  end

  def print_data([hvalues | []],[hcolumns | []]), 
    do: IO.puts("#{hcolumns}: #{hvalues}")

  def print_data([hvalues | tvalues],[hcolumns | tcolumns]) do
    IO.puts("#{hcolumns}: #{hvalues}")
    print_data(tvalues,tcolumns)
  end
end
