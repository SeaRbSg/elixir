defmodule Conditions.TableFormatter do
  def print_table_rows(data,columns_to_print) do 
    values = columns_to_print 
            |> Enum.map(&(get_value(data,&1)))
    
    value_len = greatest_column_size( ["Value"|values] ) 
    value_form = getForm(value_len," ","-")

    field_len = greatest_column_size( ["Weather Attribute"| columns_to_print] )
    field_form = getForm(field_len," ","")

    #Print header
    print_data(["Weather Attribute"],["Value"],value_form,field_form, " | ")
    #Print separator
    print_data(["-"],["-"],getForm(value_len,"-","-"),getForm(field_len,"-",""), " + ")
    #Print table data
    print_data(columns_to_print, values, value_form, field_form, " : ")
  end

  def get_value(xml,value) do
    xml 
    |> Exmerl.XPath.find("//current_observation/#{value}/text()")
    |> xmlvalue
  end
  
  def xmlvalue({[{_,_,_,_,value,_}], _}), do: value 

  def print_data([hcolumns | []],[hvalues | []],vformat,fformat, separator), 
    do: :io.format(fformat <> separator <> vformat <> "~n", [hcolumns, hvalues])
  def print_data([hcolumns | tcolumns],[hvalues | tvalues],vformat,fformat,separator) do
    :io.format(fformat <> separator <> vformat <> "~n", [hcolumns, hvalues])
    print_data(tcolumns, tvalues,vformat,fformat, separator)
  end

  def greatest_column_size(list) do
    Enum.reduce(list,0,&(Enum.max([String.length(to_string(&1)),&2])))
  end

  def getForm(length, padder,ljust) do
    "~#{ljust}#{length}..#{padder}s"
  end

end
