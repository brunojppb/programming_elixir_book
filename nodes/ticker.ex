
# Server with public interface for other processes register to it
# and get notified avery 2 seconds
defmodule Ticker do
  @interval 2000 # 2 seconds
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients) do
    receive do
      { :register, pid } ->
        IO.puts "registering client with PID #{inspect(pid)}"
        generator([pid | clients])
    after
      @interval ->
        IO.puts "tick"
        send_tick = fn client ->
          IO.puts "sending tick to client #{inspect(client)}"
          send client, { :tick }
        end
        clients
          |> Enum.reverse()
          |> Enum.each(send_tick)
        generator(clients)
    end
  end

end


defmodule Client do

  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts "Tick received in client"
        receiver()
    end
  end

end