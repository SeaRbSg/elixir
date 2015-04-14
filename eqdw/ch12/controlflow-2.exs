# I feel like the multimethod and the case strategies are effectively equivalent,
# at least the way I did them

# However, I like the multimethod implementation the best.

# I like it because it forces me to think declaratively instead of imperatively
# The cond and the case implementations can both be read as a sort of "do this
# then do that then do the other". "Check rem 15, then check rem 5, then check rem 3"

# The multimethod implementation, by hijacking my conception of functions,
# forces me to think in terms of identities and referential transparencies:
# "fizzbuzz(n) is Fizz when n % 3 == 0" instead of "Check if n%3 is zero"
