defmodule MyList do
  def maxVal(list) do
    maxVal(list, 0)
  end

  defp maxVal([], maxValue) do
    maxValue
  end

  defp maxVal([head | tail], maxValue) when head > maxValue do
    maxVal(tail, head)
  end

  defp maxVal([head | tail], maxValue) when head < maxValue do
    maxVal(tail, maxValue)
  end
end

l = [10, 20, 455, 2, 30, 35, 24654, 1122, 338_374, 4555]
IO.puts("Max value in the list is #{MyList.maxVal(l)}")
