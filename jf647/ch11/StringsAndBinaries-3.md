```
Interactive Elixir (1.0.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> ['cat'|'dog']
['cat', 100, 111, 103]
```

The first element of the list is itself a list:

    [ [ 'c', 'a', 't' ], 'd', 'o', 'g']

So we ask it to print a mix of lists and chars and it doesn't do the
conversion to a printable string.  But in printing the first element,
that is a printable string.
