defmodule Weather do

  def for_location([], _), do: []
  def for_location([ head = [_, location_id, _, _] | tail ], location_id) do
    [ head | for_location(tail, location_id) ]
  end
  def for_location([ _ | tail], location_id), do: for_location(tail, location_id)

  def test_data do
    [ [1366225622, 26, 15, 0.125], [1366225622, 27, 15, 0.45], [1366225622, 28, 21, 0.25], [1366225622, 30, 21, 0.25], [1366225622, 30, 21, 0.25] ]
  end

end
