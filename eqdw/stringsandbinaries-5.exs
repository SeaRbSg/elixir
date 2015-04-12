defmodule StringsAndBinaries do

  def center(arr) do

    width = Enum.max_by(arr, fn (elem) -> String.length(elem) end) |> String.length

    Enum.each(arr, fn(arr) -> print_center(arr, width) end)
  end

  def print_center(str, width) do
    padding = width - String.length(str)
    padl = div(padding, 2)
    padr = case rem(padding, 2) do
      0 ->
        padl
      1 ->
        padl + 1
      _ ->
        raise "Math is broken"
    end

    IO.puts "#{String.duplicate(" ", padl)}#{str}#{String.duplicate(" ", padr)}"
  end
end
