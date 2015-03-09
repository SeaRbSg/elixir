# Will match
a = [1, 2, 3]

# Will match
a = 4

# Will match
4 = a

# Will not match
# [a, b] = [1, 2, 3]

# Will match
a = [[1, 2, 3]]

# Will match
[a] = [[1, 2, 3]]

# Will not match
# [[a]] = [[1, 2, 3]]