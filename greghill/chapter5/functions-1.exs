list_concat = fn ([:a, :b], [:c, :d]) -> [:a, :b, :c, :d] end
list_concat.([:a, :b], [:c, :d])
#=> [:a, :b, :c, :d]

list_concat2 = fn ([:a, :b], [:c, :d]) -> [:a, :b] ++ [:c, :d] end
#=> [:a, :b, :c, :d]

sum = fn a, b, c -> a + b + c end
sum.(1, 2, 3)
#=> 6

pair_tuple_to_list = fn { a, b } -> [ a, b ] end
pair_tuple_to_list.({1234,5678})
#=> [1234, 5678]
