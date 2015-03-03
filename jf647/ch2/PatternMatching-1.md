# PatternMatching-3

Which of the following would match?

    a = [1, 2, 3]

yes

    a = 4

yes

    4 = a

yes

    [a, b] = [ 1, 2, 3 ]

no (list sizes are different)

    a = [ [ 1, 2, 3 ] ]

yes

    [ a..5 ] = [ 1..5 ]

yes

    [a] = [ [ 1, 2, 3 ] ]

yes

    [[a]] = [ [ 1, 2, 3 ] ]

no (internal list sizes are different)
