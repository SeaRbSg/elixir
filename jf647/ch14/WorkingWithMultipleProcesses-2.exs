defmodule Echo do
  def echo do
    receive do
      {sender, msg} ->
        send sender, {self, msg}
    end
  end
end

defmodule Receiver do
  def get do
    receive do
      {_, msg} ->
          IO.puts msg
      get
    end
  end
end

pid1 = spawn(Echo, :echo, [])
pid2 = spawn(Echo, :echo, [])

send pid1, {self, "Fred"}
send pid2, {self, "Betty"}

Receiver.get
