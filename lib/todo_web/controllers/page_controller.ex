defmodule TodoWeb.PageController do
  use TodoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn, %{"thing"=>thing}) do
    render(conn, "hello.html", name: thing)
  end

end
