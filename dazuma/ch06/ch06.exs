# ModulesAndFunctions-1,2,3

defmodule Times do

  def double(n), do: n * 2

  def triple(n), do: n * 3

  def quadruple(n), do: double(double(n))

end


# ModulesAndFunctions-4

defmodule Sum do

  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

end


# ModulesAndFunctions-5

defmodule Gcd do

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

end


# ModulesAndFunctions-6

defmodule Chop do

  def guess(actual, range=lo..hi), do: guess1(actual, range, div(lo + hi, 2))

  def guess1(actual, range, g) do
    IO.puts("Is it #{g}")
    guess2(actual, range, g)
  end

  def guess2(actual, _, actual), do: actual
  def guess2(actual, lo.._, g) when actual < g, do: guess(actual, lo..(g-1))
  def guess2(actual, _..hi, g) when actual > g, do: guess(actual, (g+1)..hi)

end


# ModulesAndFunctions-7

defmodule Find do

  def float2string(f), do: :erlang.float_to_binary(f, [decimals: 2])

  def env(n), do: System.get_env(n)

  def extension(path), do: Path.extname(path)

  def curwd(), do: System.cwd()

  # Install jiffy from https://github.com/davisp/jiffy
  def json2elixir(json), do: :jiffy.decode(json)

  def shell(cmd, args), do: System.cmd(cmd, args)

end
