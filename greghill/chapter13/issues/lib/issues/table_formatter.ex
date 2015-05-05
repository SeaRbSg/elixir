defmodule Issues.TableFormatter do 
  @ doc """
  Takes a list of row data, where each row is a HashDict, and a list of headers.
  Prints a table to STDOUT of the data from each row identified by each header.
  That is, each header identifies a column, and those columns are extracted and
   printed from the rows. We calculate the width of each column to fit the 
   longest element in that column.
  """



  def print_table_rows(data,columns_to_print) do 
    max_column_widths = columns_to_print
                        |> get_max_widths(data)
                        |> get_header_widths(columns_to_print)  #need to double check that a header isn't  longer than a column, if so, the
                                                                #we need to set the max with to that

    printheader(columns_to_print,max_column_widths)
    printseparator(max_column_widths)    
    printrows(columns_to_print,data, max_column_widths)          
  end

  @doc """
    Given a list of HashDicts, where each HashDicts contains a keyed list of columns,
    return a list containing the longest length of the data in each column. The ` columns `
    parameter contains the list of columns to extract.

    ## Example
    iex>  testdata = HashDict.new
    iex>  testdata = Dict.put(testdata,"head1",10)
    iex>  testdata = Dict.put(testdata,"head2","valuevslfgdd")
    iex>  testdata2 = testdata
    iex>  testdata2 = Dict.put(testdata2,"head2","valuevslfgddsdfsdf")
    iex>  testlist = [testdata,testdata2]
    iex>  Issues.TableFormatter.get_max_widths(["head1", "head2"],testlist)
    [2,18]
  """

  def get_max_widths(columns,data) do
    for column <- columns, do: greater_column_size(data,column)
  end

  def get_header_widths([],[]), do: []
  def get_header_widths([hw|tw], [hc|tc]) do
    [ Enum.max([hw, String.length(hc)]) | get_header_widths(tw,tc) ]
  end
  
  def greater_column_size(list,column_name) do
    Enum.reduce(list,0,&(Enum.max([String.length(to_string(&1[column_name])),&2])))
  end

  def printheader(columns, widths) do
    getFormatter(widths,"\s","|")
    |> :io.format(columns)
  end

  def printseparator(widths) do
    getFormatter(widths,"-", "+")
    |> :io.format(Enum.map(widths,fn(_)-> "" end))
  end

  def printrows(columns,issues,max_column_widths) do 
    format = getFormatter(max_column_widths," ", "|")

    for issue <- issues do
      :io.format(format,(for column <- columns, do: to_string(issue[column])))
    end
  end

  def getFormatter([head|[]],padder,_), do: " ~-#{head}..#{padder}s ~n"
  def getFormatter([head|tail], padder,separator) do
    " ~-#{head}..#{padder}s " <> separator <> getFormatter(tail, padder,separator)
  end

end
