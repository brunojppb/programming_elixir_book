defmodule GreatestCommonDivisor do
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

IO.puts("The greatest common divisor between 4, 8 is #{GreatestCommonDivisor.gcd(4, 8)}")
IO.puts("The greatest common divisor between 25, 45 is #{GreatestCommonDivisor.gcd(25, 45)}")
