defmodule Issues.GitHubIssues do
  require Logger
  @user_agent [{ "User-agent", "Elixir dave@pragprog.com" },
               {"SOAP-Action", ""}]


  def fetch(username, projectname) do
    Logger.info "Fetching issues project #{projectname} by #{username}"
    issues_url(username, projectname)
    |> HTTPoison.get!(@user_agent)
    |> handle_response
 
  end

  @github_url Application.get_env(:issues, :github_url)
  def issues_url(username, projectname) do
    Logger.debug "Fetching from #{@github_url}/repos/#{username}/#{projectname}/issues"
    "#{@github_url}/repos/#{username}/#{projectname}/issues"
  end

  def handle_response(%{status_code: 200, body: body}) do
    Logger.info "Successful response"
    Logger.debug fn -> IO.inspect body end
    {:ok, :jsx.decode(body)}
  end

  def handle_response(%{status_code: status, body: body}) do
    Logger.error "Error #{status} returned"
    {:error, :jsx.decode(body)}
  end
end
