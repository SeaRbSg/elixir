defmodule Client do
  import :timer, only: [ sleep: 1 ]
  @interval 2000   # 2 seconds

  def start_and_register do

    case :global.whereis_name(:first) do
      :undefined -> 
        pid = spawn(__MODULE__, :receiver, [self])
        :global.register_name(:first, pid)
      first_pid ->
        pid = spawn(__MODULE__, :receiver, [first_pid])
  
    end 

    # first we start the new reciver 
    case :global.whereis_name(:last) do
      :undefined ->  last_pid = pid 
      last_pid -> inspect last_pid
    end 
    # next we register this pid and tell the last 
    # started server to start sending to this server.
    :global.register_name(:last, pid)
    send(last_pid, { :update, pid })
  end

  def wait_and_send_msg(next_client) do
    sleep @interval
    send next_client, { :tick }
  end

  def receiver(next_client) do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        spawn(Client,:wait_and_send_msg,[next_client])
        receiver(next_client)
      { :update, new_next_client} ->
        IO.puts "updating next cliet PID"
        receiver(new_next_client)
    end
  end
end