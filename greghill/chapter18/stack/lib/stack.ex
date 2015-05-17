defmodule Stack do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do

    {:ok, _pid} = Stack.Supervisor.start_link([1,2,3])
  end
end
