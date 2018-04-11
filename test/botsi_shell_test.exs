defmodule BotsiShellTest do
  use ExUnit.Case
  doctest BotsiShell

  test "greets the world" do
    assert BotsiShell.hello() == :world
  end
end
