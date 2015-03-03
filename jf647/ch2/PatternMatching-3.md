# PatternMatching-3

If you assume the variable a initially contains the value 2, which of the following will match?

    [ a, b, a ] = [ 1, 2, 3 ]

no (a doesn't match 1 or 3)

    [ a, b, a ] = [ 1, 1, 2 ]

no (a matches 2 in position 3 but is rebound to be 1 earlier in the match)

    a = 1

yes

    ^a = 2

no (a is anchored to its previous value of 1)

    ^a = 1

yes

    ^a = 2 - a

yes
