defmodule GiphySrcaper.Image do
  defstruct [:id, :url, :username, :title]

  alias GiphySrcaper.Image, as: Image

  def from_map(%{"id" => id, "url" => url, "username" => username, "title" => title}) do
    %Image{id: id, url: url, username: username, title: title}
  end

  # I realize you'd want more descriptive Error modules in
  # general but i wanted to play around with this and
  # see how it works.
  def from_map(_) do
    raise RuntimeError, message: "Not a map!"
  end
end
