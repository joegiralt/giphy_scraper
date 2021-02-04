defmodule GiphyClient do
  use HTTPoison.Base

  @expected_fields ~w(
    data
    pagination
    meta
  )

  def process_request_url(url) do
    "api.giphy.com/v1/" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end