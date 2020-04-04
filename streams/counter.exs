defmodule Countdown do
  def sleep(seconds) do
    receive do
    after
      seconds * 1000 -> nil
    end
  end

  def say(text) do
    # on linux, use the command 'espeak' instead
    spawn(fn -> :os.cmd('say #{text}') end)
  end

  def timer do
    Stream.resource(
      # number of seconds to start next minute
      fn ->
        {_h, _m, s} = :erlang.time()
        60 - s - 1
      end,
      fn
        # wait for the next second, then return its countdown
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          {[inspect(count)], count - 1}
      end,
      # nothing to dealocate
      fn _ -> nil end
    )
  end
end

counter = Countdown.timer()

printer = counter |> Stream.each(&IO.puts/1)
speaker = printer |> Stream.each(&Countdown.say/1)

# now lets see this collection being generated lazily
speaker |> Enum.take(5)
