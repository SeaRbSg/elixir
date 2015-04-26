defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [ app:     :issues,
      version: "0.0.1",
      elixir:  "~> 1.0",
      deps:    deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [ :logger, :httpoison, :jsx ]
    ]
  end

  defp deps do
    [
      { :httpoison, "~> 0.4.0" },
      { :jsx,       "~> 2.0" }
    ]
  end
end
