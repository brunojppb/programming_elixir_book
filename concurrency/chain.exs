defmodule Chain do

  def counter(next_pid) do
    receive do
      n -> send next_pid, n + 1
    end
  end

  def create_processes(n) do
    code_to_run = fn (_, send_to) ->
      spawn(Chain, :counter, [send_to])
    end

    last_process_pid = Enum.reduce(1..n, self(), code_to_run)
    # we start off by sending 0 to the last process
    # and the serial message passing from process to process
    # will cascade from last to first
    send(last_process_pid, 0)

    # Now wait for the final result
    receive do
      final_result when is_integer(final_result) ->
        "Result is #{inspect(final_result)}"
    end
  end

  def run(n) do
    :timer.tc(Chain, :create_processes, [n])
    |> IO.inspect
  end

end

# Run a million processes via terminal
# elixir --erl "+P 1000000" -r chain.exs -e "Chain.run(1_000_000)"
#