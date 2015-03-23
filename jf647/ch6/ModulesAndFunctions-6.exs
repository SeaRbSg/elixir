defmodule Chop do
  def guess(actual, low..high) do
    _guess(actual, low..high, midpoint(low, high))
  end

  def _guess(actual, _.._, guess) when actual == guess do
    IO.puts "Is it #{guess}?"
    IO.puts actual
  end

  def _guess(actual, low.._, guess) when actual < guess do
    IO.puts "Is it #{guess}?"
    _guess(actual, low..guess, midpoint(low, guess))
  end

  def _guess(actual, _..high, guess) when actual > guess do
    IO.puts "Is it #{guess}?"
    _guess(actual, guess..high, midpoint(guess, high))
  end

  def midpoint(x, y), do: div(x+y, 2)
end
