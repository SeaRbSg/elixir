defmodule StringsAndBinaries do

  def to_i(str) do
    {rtn, _} = :string.to_integer(str)
    rtn
  end

  def calculate(string) do
    
    {num1, num2, op} = preprocess
  end

  def preprocess(string, chr) do
    {num1, num2, op} = _preprocess([], string, chr)
    {to_i(num1), to_i(num2), op}
  end

  # accumulation in pre inverts the number
  def _preprocess(pre, [chr|str], chr) do
    {Enum.reverse(pre), str, chr}
  end

  def _preprocess(pre, [h|str], chr) do
    _preprocess([h | pre], str, chr)
  end

end
