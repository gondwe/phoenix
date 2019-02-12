defmodule TodoWeb.OurController do
    use TodoWeb, :controller
  
    def index(conn, _params) do
      render(conn, "index.html")
    end

    def todos(conn, _params) do
      render(conn,"todos.html")
    end

end
  