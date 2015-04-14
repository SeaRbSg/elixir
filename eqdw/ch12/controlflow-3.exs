defmodule ControlFlow do
  def ok!({:ok, data}) do
    data
  end

  def ok!({:error, data}) do
    raise inspect(data)
  end
end
