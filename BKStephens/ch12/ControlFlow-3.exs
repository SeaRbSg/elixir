defmodule ControlFlow do
  def ok!( {:ok, data} ), do: data
  def ok!( {error, message} ), do: raise("Custom error: #{error}: #{message}")
end

ControlFlow.ok! File.open("somefile")
