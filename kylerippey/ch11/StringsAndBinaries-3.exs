# iex(1)> [ 'cat' | 'dog' ]
# ['cat', 100, 111, 103]

# Because the first element in the resulting list
# is actually a list of integers, for example:

# iex(2)> [ [1,2,3] | [4,5,6] ]
# [[1, 2, 3], 4, 5, 6]