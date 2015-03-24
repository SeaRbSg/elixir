# Convert a flaot to a string with two decimal digits

```
iex(1)> :io.format('~.2f', [1.2345])
1.23:ok
```

Not quite sure how to suppress the :ok that format returns

# Get the value of an OS environment variable

```
M00972939 ➜  elixir_study_group git:(master) ✗ FOO=bar iex
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> System.get_env("FOO")
"bar"
```

# Return the extension component of a filename

```
M00972939 ➜  ch6 git:(master) ✗ ls
ModulesAndFunctions-1.exs ModulesAndFunctions-3.exs ModulesAndFunctions-4.exs ModulesAndFunctions-5.exs ModulesAndFunctions-6.exs ModulesAndFunctions-7.exs
ModulesAndFunctions-2.md  ModulesAndFunctions-3.md  ModulesAndFunctions-4.md  ModulesAndFunctions-5.md  ModulesAndFunctions-6.md  ModulesAndFunctions-7.md
M00972939 ➜  ch6 git:(master) ✗ iex
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Path.extname("ModulesAndFunctions-7.md")
".md"
```

# Return the process's current working directory

```
M00972939 ➜  ch6 git:(master) ✗ pwd
/Users/james/projects/elixir_study_group/jf647/ch6
M00972939 ➜  ch6 git:(master) ✗ iex
Erlang/OTP 17 [erts-6.3] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> File.cwd()
{:ok, "/Users/james/projects/elixir_study_group/jf647/ch6"}
```

# Convert a string containing JSON into Elixir Data Structures

* https://hex.pm/packages/json, which points to https://github.com/cblage/elixir-json

# Execute a command in your OS shell

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> System.cmd("ls", ["-la"], [cd: "/Users/james/projects/elixir_study_group/jf647/ch6"])
{"total 96\ndrwxr-xr-x  14 james  FOO\\Domain Users   476 Mar 23 17:22 .\ndrwxr-xr-x   5 james  FOO\\Domain Users   170 Mar 17 18:55 ..\n-rw-r--r--   1 james  FOO\\Domain Users    77 Mar 17 18:58 ModulesAndFunctions-1.exs\n-rw-r--r--   1 james  FOO\\Domain Users   709 Mar 17 18:59 ModulesAndFunctions-2.md\n-rw-r--r--   1 james  FOO\\Domain Users   135 Mar 17 19:00 ModulesAndFunctions-3.exs\n-rw-r--r--   1 james  FOO\\Domain Users   354 Mar 17 19:01 ModulesAndFunctions-3.md\n-rw-r--r--   1 james  FOO\\Domain Users    75 Mar 23 17:22 ModulesAndFunctions-4.exs\n-rw-r--r--   1 james  FOO\\Domain Users   366 Mar 23 17:22 ModulesAndFunctions-4.md\n-rw-r--r--   1 james  FOO\\Domain Users    82 Mar 23 17:22 ModulesAndFunctions-5.exs\n-rw-r--r--   1 james  FOO\\Domain Users   363 Mar 23 17:22 ModulesAndFunctions-5.md\n-rw-r--r--   1 james  FOO\\Domain Users   567 Mar 23 17:22 ModulesAndFunctions-6.exs\n-rw-r--r--   1 james  FOO\\Domain Users   377 Mar 23 17:22 ModulesAndFunctions-6.md\n-rw-r--r--   1 james  FOO\\Domain Users    92 Mar 22 23:15 ModulesAndFunctions-7.exs\n-rw-r--r--   1 james  FOO\\Domain Users  1845 Mar 23 17:32 ModulesAndFunctions-7.md\n",
 0}
```

System.cmd returns a 'collectible', which involves protocols and that we haven't learned yet.  I
assume it would be possible to format this one line at a time by streaming it to something like
Ruby's map.
