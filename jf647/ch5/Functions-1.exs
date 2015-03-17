list_concat = fn a, b -> a ++ b end

IO.inspect list_concat.([:a, :b], [:c, :d])
