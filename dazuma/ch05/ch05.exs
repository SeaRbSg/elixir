# Functions-1

list_concat = fn a, b -> a ++ b end

sum = fn a, b, c -> a + b + c end

pair_tuple_to_list = fn {a, b} -> [a, b] end


# Functions-2

fizzbuzz1 = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, result -> result
end


# Functions-3

fizzbuzz2 = fn n -> fizzbuzz1.(rem(n, 3), rem(n, 5), n) end


# Functions-4

prefix = fn pre ->
  fn suf ->
    "#{pre} #{suf}"
  end
end


# Functions-5

Enum.map [1,2,3,4], &(&1 + 2)

Enum.each [1,2,3,4], &IO.inspect/1
