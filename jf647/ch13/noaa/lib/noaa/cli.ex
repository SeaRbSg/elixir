import NOAA.TableFormatter, only: [ print_table_for_columns: 2 ]

defmodule NOAA.CLI do

  @default_count 4

  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of the last _n_ NOAA in a github project
  """

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or --help, which returns :help

  Otherwise it is a github user name, project name, and (optionally)
  the number of entries to format.

  Return a tuple of `{ user, project, count }`, or `:help` if help was given.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, strict:   [ help: :boolean],
                                     aliases:  [ h: :help])
    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [ site ], _ }       -> site
      _                        -> :help
    end
  end

  defp process(:help) do
    IO.puts """
    usage: NOAA <site>
    """
    System.halt(0)
  end

  defp process(site) do
    NOAA.GithubNOAA.fetch(site)
    |> decode_response
    |> convert_to_hashdict(site)
    |> print_table_for_columns(["site", "location", "lat", "long", "weather", "temp"])
  end

  defp decode_response(:error) do
    IO.puts "Error fetching from NOAA"
    System.halt(2)
  end
  defp decode_response({:ok, xml}), do: xml

  defp convert_to_hashdict(xml, site) do
    [
      Enum.into([
        { "site", site },
        { "location", Exmerl.XPath.find(xml, "//location/text()") |> xmltext },
        { "lat", Exmerl.XPath.find(xml, "//latitude/text()") |> xmltext },
        { "long", Exmerl.XPath.find(xml, "//longitude/text()") |> xmltext },
        { "weather", Exmerl.XPath.find(xml, "//weather/text()") |> xmltext },
        { "temp", Exmerl.XPath.find(xml, "//temp_f/text()") |> xmltext }
      ], HashDict.new)
    ]
  end

  defp xmltext({[{_, _, _, _, text, _}], _}), do: text
end
