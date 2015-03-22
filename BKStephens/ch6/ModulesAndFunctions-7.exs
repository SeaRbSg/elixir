# Convert a float to a string with two decimal digits.
:io.format("~.2f~n", [2.0/3.0])

# Get the value of a noerating-system environment variable.
IO.puts System.get_env("HOME")

# Return the extension component of a file name
IO.puts Path.extname("/Users/benstephens/programming_elixir/elixir/BKStephent/ch6/ModulesAndFunction-6.exs")

# Return the process's current working directory
IO.puts System.cwd

# Find how to convert a string of JSON into Elixir data structure
#https://github.com/guedes/exjson
#https://github.com/hio/erlang-json

# Execute a command in your operating system's shell
System.cmd("say", ['Nailed it'])
