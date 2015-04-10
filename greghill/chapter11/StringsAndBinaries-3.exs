IO.inspect [ 'cat' | 'dog' ]
#=> ['cat', 100, 111, 103]

@doc """
The rule in elixir is that only a complete list of printable characters is printed in ascii form. 
This list is above is a list of three ascii characters with the head of it being another list (the 'cat')
which in an of itself isn't printable. However in that list is another list of printable characters so
these can be shown in their printable ascii form. 
"""