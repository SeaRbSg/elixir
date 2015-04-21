defmodule NOAA.Mixfile do
  use Mix.Project

  def project do
    [app: :NOAA,
     version: "0.0.1",
     name: "NOAA",
     source_url: "https://github.com/SeaRbSg/elixir/tree/master/jf647/ch13/noaa",
     elixir: "~> 1.0",
     escript: escript_config,
     deps: deps]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      { :httpoison, "~> 0.6" },
      { :exmerl, "~> 0.1" },
      { :earmark, "~> 0.1", only: :dev },
      { :ex_doc, "~> 0.7", only: :dev }
    ]
  end

  defp escript_config do
    [ main_module: NOAA.CLI ]
  end
end
