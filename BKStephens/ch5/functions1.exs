list_concat = fn first_list, second_list ->
  first_list ++ second_list 
end
IO.puts Enum.join(list_concat.([1,2,3],[4,5,6]))

sum = fn a, b, c ->
  a + b + c
end
IO.puts sum.(1, 2, 3)

pair_tuple_to_list = fn { a, b } ->
  [a, b]
end
IO.puts Enum.join(pair_tuple_to_list.( { 1234, 5678} ))
