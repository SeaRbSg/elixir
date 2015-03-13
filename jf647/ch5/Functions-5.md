# Enum.map [1, 2, 3, 4], fn x -> x + 2 end

Enum.map [1, 2, 3, 4], &(&1 + 2)

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Enum.map [1, 2, 3, 4], fn x -> x + 2 end
[3, 4, 5, 6]
iex(2)> Enum.map [1, 2, 3, 4], &(&1 + 2)
[3, 4, 5, 6]
```

# Enum.each [1, 2, 3, 4], fn x -> IO.inspect x end

Enum.each [1, 2, 3, 4], &(IO.inspect(&1))

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Enum.each [1, 2, 3, 4], &(IO.inspect(&1))
1
2
3
4
:ok
```

OR

Enum.each [1, 2, 3, 4], &IO.inspect/1

```
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Enum.each [1, 2, 3, 4], &IO.inspect/1
1
2
3
4
:ok
```
