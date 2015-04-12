#   [ 'cat' | 'dog' ]
# ==> ['cat', 100, 111, 103]

# WHHYYYY!?!?!?!

# Why? LRN2CONS DUMPASS

# the | operator takes whatever *value* is on the LHS
# and puts it at the front of the *list* that is on the RHS
# 'cat' and 'dog' are both lists.
# Elixir dutifully puts the *value* 'cat' on the front
# of the *list* 'dog', giving us something kind of like this:

# [ ['c', 'a', 't']. 'd', 'o', 'g']

# The only reason it looks funky is because elixir sees a
# top level list with 4 elements, only three of which are printable
# and concludes the list unprintable as ascii
