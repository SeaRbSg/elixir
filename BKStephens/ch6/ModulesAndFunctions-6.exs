defmodule Chop do
  def guess(actual, min..max) do
    half_number = div(min+max, 2)
    IO.puts "Is it #{half_number}"
    is_it(actual, half_number, min..max)
  end

   def is_it(actual, actual, _), do: IO.puts actual
   def is_it(actual, not_actual, min..max) when not_actual < actual, do: guess(actual, not_actual+1..max)
   def is_it(actual, not_actual, min..max) when not_actual > actual, do: guess(actual, min..not_actual-1)
end

Chop.guess(273, 1..1000)
