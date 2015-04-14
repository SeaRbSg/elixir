defmodule MyString do
  def ascii(list), do: Enum.all?(list, &(&1 in ?\s..?~))
end
