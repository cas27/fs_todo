defmodule FsTodoWeb.PageController do
  use FsTodoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
