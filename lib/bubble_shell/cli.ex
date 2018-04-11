defmodule BubbleShell.CLI do
  require Logger

  alias Bubble.{BotServer, Parser, Interpreter}
  alias BubbleShell.Runner

  def main([file]) do

    # read and parse
    bot =
      File.read!(file)
      |> Parser.parse()
      |> Interpreter.load("main")

    # start bot process
    {:ok, pid} = BotServer.start_link(Runner, [self()])

    # spawn input process
    {:ok, _input_pid} = BubbleShell.Input.start_link(pid)

    # run the bot
    :ok = BotServer.run(pid, bot)

    # wait for completion
    wait(pid)
  end
  def main(_) do
    IO.puts "Usage: bubble_shell <file>"
    System.halt(1)
  end

  defp wait(pid) do
    receive do
      :exit -> :ok
      _ ->
        wait(pid)
    after 100 ->
        case check_idle(pid) do
          true -> :ok
          false -> wait(pid)
        end
    end
  end

  defp check_idle(pid) do
	  match?(%{meta: nil}, BotServer.get_status(pid))
  end

end
