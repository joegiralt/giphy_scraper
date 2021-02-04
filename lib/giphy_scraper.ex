defmodule GiphyScraper do

  @giphy_api_key Application.fetch_env!(:giphy_scraper, :giphy_api_key)

  def search(query) do
    GiphyClient.start
    GiphyClient.get!("gifs/search", search_headers(), search_options(query))
      |> IO.inspect
  end

  defp search_headers do
    [{"Accept", "application/json"}]
  end

  defp search_options(query) do
    [
      params: %{
        api_key: @giphy_api_key,
        q: query,
        weirdness: 10,
        limit: 25
      }
    ]
  end
end
