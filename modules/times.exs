defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n), do: n * 3

  def quadruple(n), do: double(n) * 2
end

# Using the compiled syntax
# do ... end is syntax sugar for "do:"
defmodule TimesShort do
  def double(n), do: n * 2
end

IO.puts("Quadruple: #{Times.quadruple(4)}")
