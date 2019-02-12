defmodule TodoWeb.TodolistController do
  use TodoWeb, :controller

  alias Todo.MyTodos
  alias Todo.MyTodos.Todolist

  def index(conn, _params) do
    todolist = MyTodos.list_todolist()
    render(conn, "index.html", todolist: todolist)
  end

  def new(conn, _params) do
    changeset = MyTodos.change_todolist(%Todolist{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"todolist" => todolist_params}) do
    case MyTodos.create_todolist(todolist_params) do
      {:ok, todolist} ->
        conn
        |> put_flash(:info, "Todolist created successfully.")
        |> redirect(to: Routes.todolist_path(conn, :show, todolist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todolist = MyTodos.get_todolist!(id)
    render(conn, "show.html", todolist: todolist)
  end

  def edit(conn, %{"id" => id}) do
    todolist = MyTodos.get_todolist!(id)
    changeset = MyTodos.change_todolist(todolist)
    render(conn, "edit.html", todolist: todolist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todolist" => todolist_params}) do
    todolist = MyTodos.get_todolist!(id)

    case MyTodos.update_todolist(todolist, todolist_params) do
      {:ok, todolist} ->
        conn
        |> put_flash(:info, "Todolist updated successfully.")
        |> redirect(to: Routes.todolist_path(conn, :show, todolist))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todolist: todolist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todolist = MyTodos.get_todolist!(id)
    {:ok, _todolist} = MyTodos.delete_todolist(todolist)

    conn
    |> put_flash(:info, "Todolist deleted successfully.")
    |> redirect(to: Routes.todolist_path(conn, :index))
  end
end
