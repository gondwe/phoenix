defmodule TodoWeb.FileController do
  use TodoWeb, :controller

  alias Todo.MyComments
  alias Todo.MyComments.File

  action_fallback TodoWeb.FallbackController

  def index(conn, _params) do
    files = MyComments.list_files()
    render(conn, "index.json", files: files)
  end

  def create(conn, %{"file" => file_params}) do
    with {:ok, %File{} = file} <- MyComments.create_file(file_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.file_path(conn, :show, file))
      |> render("show.json", file: file)
    end
  end

  def show(conn, %{"id" => id}) do
    file = MyComments.get_file!(id)
    render(conn, "show.json", file: file)
  end

  def update(conn, %{"id" => id, "file" => file_params}) do
    file = MyComments.get_file!(id)

    with {:ok, %File{} = file} <- MyComments.update_file(file, file_params) do
      render(conn, "show.json", file: file)
    end
  end

  def delete(conn, %{"id" => id}) do
    file = MyComments.get_file!(id)

    with {:ok, %File{}} <- MyComments.delete_file(file) do
      send_resp(conn, :no_content, "")
    end
  end
end
