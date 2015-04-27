defmodule Parse do

  def calculate(calc_str), do: _calctype( calc_str, 0)

  defp _calctype([],                  value), do: value
  defp _calctype([ digit | tail ],    value) when digit in '0123456789' do
    do: _calctype( tail, value* 10 + digit - ?0)
  defp _calctype([ ?-  | tail ], value), do: value - _calctype( tail, 0)
  defp _calctype([ ?+  | tail ], value), do: value + _calctype( tail, 0)
  defp _calctype([ ?/  | tail ], value), do: value / _calctype( tail, 0)
  defp _calctype([ ?*  | tail ], value), do: value * _calctype( tail, 0)
  defp _calctype([ ?\s | tail ], value), do: _calctype(tail, value)
  defp _calctype([ unexpected | _ ], _), do: raise "Invalid digit '#{[unexpected]}'"


  # defp _get_numbers([],                  value), do: value
  # defp _get_numbers([ ?\s| tail ],       value), do: _get_numbers(tail, value)

  # defp _get_numbers([ non_digit | tail], value) do
  #   IO.puts "Non digit: #{non_digit} rest #{IO.inspect tail}"
  #   _calctype([ non_digit | tail], value)
  # end

end