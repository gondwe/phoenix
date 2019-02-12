defmodule TodoWeb.TodolistControllerTest do
  use TodoWeb.ConnCase

  alias Todo.MyTodos

  @create_attrs %{completed: true, item: "some item"}
  @update_attrs %{completed: false, item: "some updated item"}
  @invalid_attrs %{completed: nil, item: nil}

  def fixture(:todolist) do
    {:ok, todolist} = MyTodos.create_todolist(@create_attrs)
    todolist
  end

  describe "index" do
    test "lists all todolist", %{conn: conn} do
      conn = get(conn, Routes.todolist_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Todolist"
    end
  end

  describe "new todolist" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.todolist_path(conn, :new))
      assert html_response(conn, 200) =~ "New Todolist"
    end
  end

  describe "create todolist" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.todolist_path(conn, :create), todolist: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.todolist_path(conn, :show, id)

      conn = get(conn, Routes.todolist_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Todolist"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.todolist_path(conn, :create), todolist: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Todolist"
    end
  end

  describe "edit todolist" do
    setup [:create_todolist]

    test "renders form for editing chosen todolist", %{conn: conn, todolist: todolist} do
      conn = get(conn, Routes.todolist_path(conn, :edit, todolist))
      assert html_response(conn, 200) =~ "Edit Todolist"
    end
  end

  describe "update todolist" do
    setup [:create_todolist]

    test "redirects when data is valid", %{conn: conn, todolist: todolist} do
      conn = put(conn, Routes.todolist_path(conn, :update, todolist), todolist: @update_attrs)
      assert redirected_to(conn) == Routes.todolist_path(conn, :show, todolist)

      conn = get(conn, Routes.todolist_path(conn, :show, todolist))
      assert html_response(conn, 200) =~ "some updated item"
    end

    test "renders errors when data is invalid", %{conn: conn, todolist: todolist} do
      conn = put(conn, Routes.todolist_path(conn, :update, todolist), todolist: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Todolist"
    end
  end

  describe "delete todolist" do
    setup [:create_todolist]

    test "deletes chosen todolist", %{conn: conn, todolist: todolist} do
      conn = delete(conn, Routes.todolist_path(conn, :delete, todolist))
      assert redirected_to(conn) == Routes.todolist_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.todolist_path(conn, :show, todolist))
      end
    end
  end

  defp create_todolist(_) do
    todolist = fixture(:todolist)
    {:ok, todolist: todolist}
  end
end
