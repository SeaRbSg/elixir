defmodule ControlFlow do
  def ok!(param) do
    case param do
      {:ok, data} -> data
      {:error, message} -> raise "Error: #{message}"
      _ -> raise "Unrecognized parameter"
    end
  end
end
