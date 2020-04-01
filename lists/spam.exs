defmodule MyList do
  def span(a, b, [head | _]) when head < b - 1 do
    [head | span(a + 1, b)]
  end

  def span(_, _, list), do: list

  def span(a, a), do: []

  def span(a, b) when b > a do
    span(a, b, [a + 1])
  end

  def span(a, b) when b < a do
    raise("a must be greater than b")
  end
end

IO.inspect(MyList.span(332, 345))
