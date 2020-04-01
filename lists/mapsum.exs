defmodule MyList do
  def mapsum([], _) do
    0
  end

  def mapsum(list, func) do
    mapsum(list, 0, func)
  end

  defp mapsum([], acc, _func) do
    acc
  end

  defp mapsum([head | tail], acc, func) do
    mapsum(tail, acc + func.(head), func)
  end
end

IO.puts("Total sum: #{MyList.mapsum([1, 2, 3, 4], &(&1 * &1))}")
