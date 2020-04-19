defmodule FibAgent do

  def start_link do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end)
  end

  def fib(pid, n) when n >= 0 do
    Agent.get_and_update(pid, &do_fib(&1, n))
  end

  defp do_fib(cache, n) do
    case cache[n] do
      nil ->
        { n_1, cache } = do_fib(cache, n-1)
        result = n_1 + cache[n-2]
        { result, Map.put(cache, n, result) }

      cache_value ->
        { cache_value, cache }
    end
  end

end

{ :ok, agent_pid } = FibAgent.start_link()
IO.puts "agent: #{inspect(agent_pid)}"

# compute the 2000th value of fibonacci
# that is fast! check it out.
IO.puts FibAgent.fib(agent_pid, 2000)