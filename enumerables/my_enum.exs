defmodule MyEnum do
  def all?([], _func), do: true

  def all?([head | tail], func) do
    if func.(head),
      do: all?(tail, func),
      else: false
  end

  def each([], _func) do
  end

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _func), do: []
  def filter(list, func), do: filter(list, [], func)
  def filter([], accumulator, _func), do: accumulator

  def filter([head | tail], accumulator, func) do
    if func.(head),
      do: filter(tail, [head | accumulator], func),
      else: filter(tail, accumulator, func)
  end
end

list = [4, 6, 10, 73, 2, 304, 234]
# All?
IO.puts("all greater than 3: #{MyEnum.all?(list, &(&1 > 3))}")

# Each
IO.puts("using each")
MyEnum.each(list, &IO.puts/1)

# Filter
# TODO: the result is in reverse order. fix it.
IO.puts("only greater than 10:")
IO.inspect(MyEnum.filter(list, fn item -> item > 10 end))

# TODO: split and take
