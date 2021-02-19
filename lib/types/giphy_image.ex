defmodule GiphyImage do
  defstruct [:id, :url, :username, :title]

  def from_map(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
    %GiphyImage{ id: id, url: url, username: username, title: title }
  end
end

# [
#   %GiphyImage{
#     id: "some_id",
#     url: "url_to_gif",
#     username: "username of creator",
#     title: "SomeGif"
#   },

#   %GiphyImage{
#     id: "some_other_id",
#     url: "url_to_gif_2",
#     username: "username of creator",
#     title: "MyGif"
#   }
# ]
