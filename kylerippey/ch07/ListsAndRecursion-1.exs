defmodule MyList do
  def mapsum([], _func), do: 0
  def mapsum([ head | tail ], func), do: func.(head) + mapsum(tail, func)
end