# ListsAndRecursion-5

list is [1, 2, 3, 4, 5] in all cases
emptylist is [] in all cases

## all?

.all?(emptylist, &(&1 < 4)) = false
.all?(list, &(&1 < 4)) = false
.all?(list, &(&1 < 5)) = true
.all?(list, &(is_integer(&1)) = true
.all?(list, &(!is_binary(&1)) = true

## each

.each(list, &(&1 * 5)) = [ 5, 10, 15, 20, 25]
.each(list, fn a -> IO.puts a + -a end) = [ 0, 0, 0, 0, 0]
.each(emptylist, &(rem(&1,3))) = []

## filter

.filter(emptylist, &(&1 > 2)) = []
.filter(list, &(&1 > 2)) = [3, 4, 5]

## split

.split(emptylist, 3) = []
.split(list, 3) = [[1, 2, 3], [4, 5]]

## take

.take(emptylist, 1) = []
.take(list, 6)) = [1, 2, 3, 4, 5]

# ListsAndRecursion-6

# ListsAndRecursion-7

# ListsAndRecursion-8
