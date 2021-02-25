defmodule GiphyScraper do
  alias GiphyScraper.Client, as: Client
  alias GiphySrcaper.Image, as: Image

  def search(query) do
    query
    |> Client.search()
    |> Enum.map(&Image.from_map/1)
  end
end
