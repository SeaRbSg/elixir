defmodule ClientRegister do
  @name :client_register

  def start do
    pid = spawn(__MODULE__, :receiver, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), {:register, client_pid}
  end

  def receiver(clients) do
    receive do
      {:register, pid} ->
        IO.puts "[ClientRegister] registering new client #{inspect pid}"
        if Enum.count(clients) > 0 do
          first_client = List.first(clients)
          last_client = List.last(clients)
          send pid, {:register_neighbor, first_client}
          send last_client, {:register_neighbor, pid}

          if Enum.count(clients) == 1 do
            # We just registered the second client, so start the ticks
            send first_client, {:tick}
          end
        end

        receiver([pid|clients])
    end
  end
end

defmodule Client do
  @interval 2000 # 2 seconds

  def start do
    pid = spawn(__MODULE__, :await_registration, [])
    ClientRegister.register(pid)
  end

  def await_registration do
    receive do
      {:register_neighbor, pid} ->
        register_neighbor(pid)
    end
  end

  def receiver(neighbor) do
    receive do
      {:register_neighbor, pid} ->
        register_neighbor(pid)
      {:tick} ->
        info "Received tick!"
        wait_and_forward(neighbor)
    end
  end

  def wait_and_forward(neighbor) do
    receive do
      {:register_neighbor, pid} ->
        wait_and_forward(pid)
    after @interval ->
      info "Sending tick to #{inspect neighbor}..."
      send neighbor, {:tick}
      receiver(neighbor)
    end
  end
  
  defp register_neighbor(new_neighbor) do
    info "Registering new neighbor: #{inspect new_neighbor}"
    receiver(new_neighbor)
  end

  defp info(message) do
    IO.puts("[#{Node.self}] #{message}")
  end
end