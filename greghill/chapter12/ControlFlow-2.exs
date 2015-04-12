defmodule Thoughts do 

@doc """
  We now have three different implementations of FizzBuzz.
  One uses cond, one uses case, and one uses separate functions with guard
  clauses. Take a minute to look at all three. Which do you feel best expresses
  the problem. Which will be easiest to maintain? 

  The pattern matching method is best as it
  - has small functions that are eash to find, update and quickly read. 
  - overall code it reduced making the whole code block easy to absorb in one
    go.

  The case style and the implementation using guard clauses are different from
  control structures in most other languages. If you feel that one of these was
  the best implementation, can you think of ways to remind yourself to 
  investigate these options as you write Elixir code in the future?

  For me these would/should only be used when pattern match on function parameters
  isn't an option and when this is the case it should be apparent after very little 
  investigation.

  

"""

end