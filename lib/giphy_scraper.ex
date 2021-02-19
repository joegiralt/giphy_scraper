defmodule GiphyScraper do

  @giphy_api_key Application.fetch_env!(:giphy_scraper, :giphy_api_key)

  def search(query) do
    GiphyClient.start
    GiphyClient.get!("gifs/search", search_headers(), search_options(query))
      |> body_data
      |> Enum.map(&GiphyImage.from_map/1)
  end

  defp body_data(resp) do
    resp.body[:data] || []
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
