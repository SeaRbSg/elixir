defmodule Repeater do
  def echo do
    receive do
      {sender, id, msg} -> send sender, {:ok, id, msg}
    end
  end
end


pid1 = spawn(Repeater, :echo, [])
pid2 = spawn(Repeater, :echo, [])

send pid1, {self, 2, "fred"}
send pid2, {self, 1, "betty"}

receive do
  {:ok, 1, response} -> IO.puts response
end

receive do
  {:ok, 2, response} -> IO.puts response
end

# 1) Is the order in which the replies are received deterministic in theory?
# No. Since there is no guarantee when a process will run then the
# messages could theoretically be returned in either order

# In practice?
# In this example, yes, it appears they always happen to be returned in order.

# 2) How could you make it deterministic?
# Include an incrementing counter with each message sent and only receive them
# in ascending order