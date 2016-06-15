defmodule MyList do

  def mapsum(list, func), do: _mapsum(list, 0, func)

  defp _mapsum([], total, _), do: total
  defp _mapsum([ head | tail ], total, func) do
    _mapsum(tail, total+func.(head), func)
  end


  def max([x]), do: x
  def max([ head | tail ]), do: Kernel.max(head, max(tail))
end
