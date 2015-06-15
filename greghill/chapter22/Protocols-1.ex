defprotocol Caesar do 
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar, for: List do 
  def encrypt(list,shift) do
    IO.puts "List received"
    CaesarEncrypt.caesar(list, shift)
  end
  def rot13(string), do: encrypt(string, 13)
end

defimpl Caesar, for: BitString do 
  def encrypt(string,shift) do
    IO.puts "BitString received"
    to_char_list(string)
    |> CaesarEncrypt.caesar(shift)
  end

  def rot13(string), do: encrypt(string, 13)
end

defmodule CaesarEncrypt do
  def caesar([],_shift), do: []
  def caesar([ head | tail ], shift) when (head + shift) > ?z, 
    do: [ ?a + ((head + shift) - ?z ) | caesar(tail, shift)]
  def caesar([ head | tail ],shift),  
    do: [head + shift | caesar(tail, shift)]
end

