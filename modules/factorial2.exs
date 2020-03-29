defmodule Factorial2 do
  def of(0), do: 1

  def of(n) when is_integer(n) and n > 0 do
    n * of(n - 1)
  end
end

IO.puts("Factorial of 13 is #{Factorial2.of(13)}")
IO.puts("Factorial of -10 is #{Factorial2.of(-10)}")
