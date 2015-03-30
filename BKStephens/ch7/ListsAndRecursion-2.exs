defmodule MyList do
  def max([head]), do: head
  def max([head|tail]), do: _max([head|tail], 0)
  
  defp _max([head], current_max), do: Kernel.max(head, current_max)
  defp _max([head|tail], current_max), do: _max(tail, Kernel.max(head, current_max)) 
end
