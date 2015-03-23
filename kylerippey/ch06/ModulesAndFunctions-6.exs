defmodule Chop do
  def guess(actual, guess, _) when guess == actual, do: IO.puts "Yep, it's #{actual}!"
  def guess(actual, guess, a.._) when guess > actual, do: guess(actual, a..guess)
  def guess(actual, guess, _..b) when guess < actual, do: guess(actual, guess..b)

  def guess(actual, a..b) do
    new_guess = div(a+b, 2)

    IO.puts "Is it #{new_guess}?"
    guess(actual, new_guess, a..b)
  end
end