defmodule Todo.MyTodosTest do
  use Todo.DataCase

  alias Todo.MyTodos

  describe "todolist" do
    alias Todo.MyTodos.Todolist

    @valid_attrs %{completed: true, item: "some item"}
    @update_attrs %{completed: false, item: "some updated item"}
    @invalid_attrs %{completed: nil, item: nil}

    def todolist_fixture(attrs \\ %{}) do
      {:ok, todolist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> MyTodos.create_todolist()

      todolist
    end

    test "list_todolist/0 returns all todolist" do
      todolist = todolist_fixture()
      assert MyTodos.list_todolist() == [todolist]
    end

    test "get_todolist!/1 returns the todolist with given id" do
      todolist = todolist_fixture()
      assert MyTodos.get_todolist!(todolist.id) == todolist
    end

    test "create_todolist/1 with valid data creates a todolist" do
      assert {:ok, %Todolist{} = todolist} = MyTodos.create_todolist(@valid_attrs)
      assert todolist.completed == true
      assert todolist.item == "some item"
    end

    test "create_todolist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MyTodos.create_todolist(@invalid_attrs)
    end

    test "update_todolist/2 with valid data updates the todolist" do
      todolist = todolist_fixture()
      assert {:ok, %Todolist{} = todolist} = MyTodos.update_todolist(todolist, @update_attrs)
      assert todolist.completed == false
      assert todolist.item == "some updated item"
    end

    test "update_todolist/2 with invalid data returns error changeset" do
      todolist = todolist_fixture()
      assert {:error, %Ecto.Changeset{}} = MyTodos.update_todolist(todolist, @invalid_attrs)
      assert todolist == MyTodos.get_todolist!(todolist.id)
    end

    test "delete_todolist/1 deletes the todolist" do
      todolist = todolist_fixture()
      assert {:ok, %Todolist{}} = MyTodos.delete_todolist(todolist)
      assert_raise Ecto.NoResultsError, fn -> MyTodos.get_todolist!(todolist.id) end
    end

    test "change_todolist/1 returns a todolist changeset" do
      todolist = todolist_fixture()
      assert %Ecto.Changeset{} = MyTodos.change_todolist(todolist)
    end
  end
end
