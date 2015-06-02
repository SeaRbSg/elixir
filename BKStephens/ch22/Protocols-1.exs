defprotocol Caesar do
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar, for: List do
  def encrypt(string, shift), do: string |> Enum.map |> encrypt_char(shift)
  def rot13(string), do: encrypt(string, 13)
  def encrypt_char(char, shift) when char in ?a..?z do
    ?a + rem(char + shift - ?a, 26)
  end
  def encrypt_char(char, shift) when char in ?A..?Z do
    ?A + rem(char + shift - ?A, 26)
  end
  def encrypt_char(char = ?\s, shift), do: char
end

defimpl Caesar, for: BitString do
  def encrypt(string, shift), do: string |> to_char_list |> Caesar.encrypt(shift)
  def rot13(string), do: encrypt(string, 13)
end
