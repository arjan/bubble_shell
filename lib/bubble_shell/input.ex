defmodule BubbleShell.Input do

  def start_link(bot_pid) do
    {:ok, spawn(fn -> get_string(bot_pid) end)}
  end

  def get_string(bot_pid) do
    message = IO.gets("") |> String.trim()
    Bubble.BotServer.send_message(bot_pid, message)
    get_string(bot_pid)
  end

end
