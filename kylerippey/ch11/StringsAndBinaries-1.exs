defmodule MyString do
  def ascii?([]), do: true
  def ascii?([ head | tail ]) when head > 31 and head < 127, do: ascii?(tail)
  def ascii?([ _ | _ ]), do: false
end