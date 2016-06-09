defmodule SumOfFirstNumbers do

  def from(0), do: 0
  def from(n), do: n + from(n-1)

end
