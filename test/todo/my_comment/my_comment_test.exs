defmodule Todo.MyCommentTest do
  use Todo.DataCase

  alias Todo.MyComment

  describe "files" do
    alias Todo.MyComment.File

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> MyComment.create_file()

      file
    end

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert MyComment.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert MyComment.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = MyComment.create_file(@valid_attrs)
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MyComment.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, %File{} = file} = MyComment.update_file(file, @update_attrs)
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = MyComment.update_file(file, @invalid_attrs)
      assert file == MyComment.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = MyComment.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> MyComment.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = MyComment.change_file(file)
    end
  end
end
