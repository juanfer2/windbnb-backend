defmodule WindbnbWeb.PageController do
  use WindbnbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
