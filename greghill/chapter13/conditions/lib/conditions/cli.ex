defmodule Conditions.CLI do
  @default_count 4
  @moduledoc """
  Handle the command line parsing and the dispatch to
  the various functions that end up generating a
  table of the last _n_ issues in a github project
  """
  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  ` argv ` can be -h or --help, which returns :help.
  Otherwise it is a github user name, project name, and (optionally) 
  the number of entries to format.
  Return a tuple of `{ user, project, count }`, or `: help ` if help was given.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean], aliases: [ h: :help])

    case parse do 
      { [ help: true ], _, _ } -> :help
      { _, [location], _ } ->  location 
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: conditions [-h|--help] location
    """
  end
  
  def process(location) do
    Conditions.Fetcher.fetch(location)
    |> decode_response
    |> Conditions.TableFormatter.print_table_rows(["temperature_string", "relative_humidity", "wind_string"])
  end

  def decode_response({:ok, body}),    do: body
  def decode_response({:error, error}) do
    {_, message } = List.keyfind(error, "message", 0)

    IO.puts " Error fetching data from weather site: #{message}"
    System.halt(2)
  end
  
end
