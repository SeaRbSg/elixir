defmodule Euler31 do
  def coin_strategies(0, _), do: 1

  def coin_strategies(money, _) when money < 0, do: 0

  def coin_strategies(_, []), do: 0

  def coin_strategies(money, [head | tail]) do
    coin_strategies(money, tail) + coin_strategies(money - head, [head | tail])
  end
end

money = 200
coins = [1, 2, 5, 10, 20, 50, 100, 200]
strategies = Euler31.coin_strategies(money, coins)
IO.puts "there are #{strategies} ways to make change for #{money}p using #{Enum.map_join(coins, ", ", &("#{&1}p"))}"
