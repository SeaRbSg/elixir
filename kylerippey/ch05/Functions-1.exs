# Usage: list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
list_concat = fn [a, b], [c, d] -> [a, b, c, d] end

# Usage: sum.(1, 2, 3) #=> 6
sum = fn a, b, c -> a + b + c end

# Usage: pair_tuple_to_list.({1234, 5678}) #=> [1234, 5678]
pair_tuple_to_list = fn {a, b} -> [a, b] end