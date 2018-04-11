defmodule BotsiShell.CLITest do
  use ExUnit.Case

  alias BotsiShell.CLI

  test "main" do
    CLI.main(["test/fixtures/test.b"])
  end

end
