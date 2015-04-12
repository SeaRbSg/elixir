defmodule IsIt do
  
  def ok!({:ok,data}), do: data
  def ok!({error,info}), do: raise(RuntimeError, message: "#{error}: #{info}")
end