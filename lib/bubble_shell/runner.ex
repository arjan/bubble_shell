defmodule BubbleShell.Runner do
  use Bubble.BotServer
  alias Bubble.Action

  require Logger

  @impl true
  def init(_) do
    {:ok, nil}
  end

  @impl true
  def handle_action(%Action{type: :text, payload: %{message: message}}, state) do
    IO.puts message
    {:ok, state}
  end

  def handle_action(%Action{type: :typing}, state) do
    {:ok, state}
  end
  def handle_action(action, state) do
    Logger.warn "Unhandled action: #{inspect action}"
    {:ok, state}
  end

end
