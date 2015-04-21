defmodule NOAA.GithubNOAA do

  require Logger

  @user_agent [ { "User-Agent", "Elixir james@nadt.net"} ]
  @noaa_url Application.get_env(:noaa, :noaa_url)

  def fetch(site) do
    Logger.info "Fetching NOAA weather data for #{site}"
    noaa_url(site)
    |> HTTPoison.get!(@user_agent)
    |> handle_response
  end

  def noaa_url(site) do
    "#{@noaa_url}/#{site}.xml"
  end

  def handle_response(%HTTPoison.Response{status_code: 200, body: body}) do
    Logger.info "Successful response"
    Logger.debug fn -> inspect(body) end
    { :ok, Exmerl.parse(body) }
  end
  def handle_response(%HTTPoison.Response{status_code: status, body: body}) do
    Logger.error "Error #{status} returned"
    :error
  end
end
