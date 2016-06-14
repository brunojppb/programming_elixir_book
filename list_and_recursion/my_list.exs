defmodule MyList do

  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [head*head | square(tail)]

  def add_1([]), do: []
  def add_1([ head | tail ]), do: [head+1 | add_1(tail)]

  def map([], func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  # show a public function that will handle the array and call
  # a private one to do the job with the extra arguments that
  # the user doesn't need to care about
  def sum(list), do: _sum(list, 0)
  # This way, we can keep the 0 away and hide the real logic in
  # private functions
  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head+total)

end
