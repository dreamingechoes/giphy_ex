defmodule GiphyEx do
  @moduledoc """
  Elixir wrapper to consume Giphy's API.

  Just a simple wrapper for the Giphy's API in order to make easy to get the more awesome gifs on the internet.
  """

  use Application
  use HTTPoison.Base

  @doc """
  Generates a request to the Giphy's API with the specified parameters to an endpoint.

  ## Example:

  If we want to make a request to the gif's search endpoint, we have to execute something like this:

    ```elixir
    iex> GiphyEx.request("gifs/search", params)
    ```
  """
  def request(endpoint, params \\ %{}) do
    GiphyEx.get!(endpoint, [], params: Map.merge(params, %{ api_key: GiphyEx.api_key })).body
  end

  @doc false
  def api_key do
    Application.get_env(:giphy_ex, :api_key) ||
    System.get_env("GIPHY_API_KEY")
  end

  @doc false
  def process_url(endpoint) do
    "http://api.giphy.com/v1/" <> endpoint
  end

  @doc false
  def process_response_body(body) do
    JSX.decode!(body)
  end

  @doc false
  def start(_type, _args) do
    GiphyEx.Supervisor.start_link
  end
end
