defmodule Issues.GithubIssues do
  require Logger

  @user_agent [{"User-agent", "Elixir dave@pragprog.com"}]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    Logger.info "Fetching user #{user}'s project #{project}"
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}), do: {:ok, :jsx.decode(body)}
  def handle_response({:ok, %{status_code: _, body: body}}), do: {:error, :jsx.decode(body)}
  def handle_response({:error, err}), do: {:error, err}
end