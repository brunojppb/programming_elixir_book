defmodule Guess do
  def guess(value, computed, range) when value < computed do
    a.._ = range
    middle = div(a + computed, 2)
    IO.puts("Value is #{middle}")
    guess(value, middle, a..computed)
  end

  def guess(value, computed, range) when value > computed do
    _..b = range
    middle = div(computed + b, 2)
    IO.puts("Value is #{middle}")
    guess(value, middle, computed..b)
  end

  def guess(value, computed, _range) when value == computed do
    IO.puts("Value is exact #{computed}")
    computed
  end

  def guess(value, range) do
    a..b = range
    middle = div(a + b, 2)
    guess(value, middle, a..b)
  end
end

Guess.guess(1000, 1..1000)
