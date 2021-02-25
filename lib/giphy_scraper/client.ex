defmodule GiphyScraper.Client do
  use HTTPoison.Base

  @giphy_api_key Application.fetch_env!(:giphy_scraper, :giphy_api_key)

  def search(query) do
    "gifs/search"
    |> get!(json_headers(), search_params(query))
    |> data_from_body
  end

  def process_request_url(url) do
    "api.giphy.com/v1/" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
    |> Enum.map(fn {k, v} -> {String.to_atom(k), v} end)
  end

  defp search_params(query) do
    [
      params: %{
        api_key: @giphy_api_key,
        q: query,
        weirdness: 10,
        limit: 25
      }
    ]
  end

  defp data_from_body(%HTTPoison.Response{status_code: 200, body: body}) do
    body[:data]
  end

  defp data_from_body(resp) do
    raise RuntimeError, message: resp
  end

  defp json_headers do
    [{"Accept", "application/json"}]
  end
end
