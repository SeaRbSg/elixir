defmodule StringsAndBinaries do

  def is_printable?([h|t]) do
    is_printable?(h) && is_printable?(t)
  end

  def is_printable?(c) when is_integer(c) and c >= 32 and c < 127 do
    true
  end

  def is_printable?([]) do
    true
  end

  def is_printable?(_) do
    false
  end

  def in_printable_ascii?(c) when is_integer(c) and c >= 32 and c < 127 do
    true
  end

  def in_printable_ascii?(_) do
    false
  end

  def enum_is_printable?(str) when is_list(str) do
    Enum.all?(str,
      fn (x, acc) -> acc && in_printable_ascii?(x) end
    )
  end

  def enum_is_printable?(_) do
    false
  end
end
