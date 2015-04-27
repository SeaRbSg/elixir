defmodule Conditions.Fetcher do 
  require Logger
  @user_agent [{ "User-agent", "Elixir dave@pragprog.com" }]


  def fetch(location) do
    Logger.info "Fetching weather conditions from #{location}"
    issues_url(location)
    |> HTTPoison.get!(@user_agent)
    |> handle_response
 
  end

  @weather_url Application.get_env(:conditions, :weather_url)
  def issues_url(location) do
    Logger.debug "Fetching from #{@weather_url}/#{location}.xml"
    "#{@weather_url}/#{location}.xml"
  end

  def handle_response(%{status_code: 200, body: body}) do
    Logger.info "Successful response"
    Logger.debug fn -> IO.inspect body end
    {:ok, Exmerl.from_string(body)}
  end

  def handle_response(%{status_code: status, body: body}) do
    Logger.error "Error #{status} returned"
    {:error, :xmerl_scan.from_string(:erlang.bitstring_to_list(body))}
  end
end