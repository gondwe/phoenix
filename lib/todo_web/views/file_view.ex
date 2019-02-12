defmodule TodoWeb.FileView do
  use TodoWeb, :view
  alias TodoWeb.FileView

  def render("index.json", %{files: files}) do
    %{data: render_many(files, FileView, "file.json")}
  end

  def render("show.json", %{file: file}) do
    %{data: render_one(file, FileView, "file.json")}
  end

  def render("file.json", %{file: file}) do
    %{id: file.id,
    name: file.name,
    published: file.published,
    viewcount: file.viewcount,
    comment_id: file.comments_id
  }
  end
end
