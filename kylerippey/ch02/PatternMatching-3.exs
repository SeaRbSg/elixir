a = 2
# [a, b, a] = [1, 2, 3] # Will not match

a = 2
# [a, b, a] = [1, 1, 2] # Will not match

a = 2
a = 1 # Will match

a = 2
^a = 2 # Will match

a = 2
# ^a = 1 # Will not match

a = 2
# ^a = 2 - a # Will not match