defmodule BubbleShell.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bubble_shell,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  defp escript do
    [main_module: BubbleShell.CLI]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :tzdata]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bubble, github: "botsquad/bubble"},
      {:tzdata, "~> 0.1.8", override: true},
    ]
  end
end
