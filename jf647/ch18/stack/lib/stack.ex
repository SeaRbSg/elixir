defmodule Stack do
  use Application

  def start(_type, _args) do
    {:ok, _pid} = Stack.Supervisor.start_link(
      Application.get_env(:stack, :initial_list)
    )
  end
end
