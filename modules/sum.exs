defmodule SumIt do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end

IO.puts("Sum from 5: #{SumIt.sum(5)}")
IO.puts("Sum from 6: #{SumIt.sum(6)}")
IO.puts("Sum from 5: #{SumIt.sum(7)}")
