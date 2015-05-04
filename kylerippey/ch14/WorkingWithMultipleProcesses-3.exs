defmodule LinkingApp do
  import :timer, only: [ sleep: 1 ]
  
  def exiting_method(sender) do
    send sender, :pong
    exit(:boom)
  end

  def receive_all do
    receive do
      msg ->
        IO.puts inspect(msg)
        receive_all
    after 1000 -> "done"
    end
  end
  
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(LinkingApp, :exiting_method, [self])

    sleep 500

    receive_all
  end
end

LinkingApp.run
