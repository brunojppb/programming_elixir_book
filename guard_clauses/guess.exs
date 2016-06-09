defmodule Chop do

  def guess(actual, range = low..high) do
    guess = div(low+high, 2)
    IO.puts "Is that #{guess}"
    guess(actual, guess, range)
  end

  def guess(actual, actual, _) do
    IO.puts "Yes, it's #{actual}"
  end

  def guess(actual, guess, low..high)
    when guess < actual,
    do: guess(actual, guess+1..high)

  def guess(actual, guess, low..high)
    when guess > actual,
    do: guess(actual, low..guess-1)

end
