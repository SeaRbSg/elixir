defmodule Ticker do
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[],[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(all_clients, todo_clients) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        # add the new pid to our all clients list
        # they will get picked up the next time the list cycles
        generator([pid | all_clients], todo_clients)
    after @interval ->
      IO.puts "tick"
      todo_clients = send_and_return_todo(all_clients, todo_clients)
      generator(all_clients, todo_clients)
    end
  end

  # send nothing, nobody left to send to
  defp send_and_return_todo([], []), do: []

  # when nobody is in the todo list, start over with everyone
  defp send_and_return_todo(all_clients, []) do
    send_and_return_todo(all_clients, all_clients)
  end

  # otherwise send do the first todo and return the remaining todos
  defp send_and_return_todo(_, [ head | tail ]) do
    IO.puts "tick to #{inspect head}"
    send head, { :tick }
    tail
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        receiver
    end
  end
end
