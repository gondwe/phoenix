defmodule Todo.MyCommentsTest do
  use Todo.DataCase

  alias Todo.MyComments

  describe "comments" do
    alias Todo.MyComments.Comment

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> MyComments.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert MyComments.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert MyComments.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = MyComments.create_comment(@valid_attrs)
      assert comment.description == "some description"
      assert comment.title == "some title"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MyComments.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{} = comment} = MyComments.update_comment(comment, @update_attrs)
      assert comment.description == "some updated description"
      assert comment.title == "some updated title"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = MyComments.update_comment(comment, @invalid_attrs)
      assert comment == MyComments.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = MyComments.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> MyComments.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = MyComments.change_comment(comment)
    end
  end

  describe "files" do
    alias Todo.MyComments.Comment

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> MyComments.create_comment()

      comment
    end

    test "list_files/0 returns all files" do
      comment = comment_fixture()
      assert MyComments.list_files() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert MyComments.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = MyComments.create_comment(@valid_attrs)
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MyComments.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{} = comment} = MyComments.update_comment(comment, @update_attrs)
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = MyComments.update_comment(comment, @invalid_attrs)
      assert comment == MyComments.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = MyComments.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> MyComments.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = MyComments.change_comment(comment)
    end
  end

  describe "files" do
    alias Todo.MyComments.File

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def file_fixture(attrs \\ %{}) do
      {:ok, file} =
        attrs
        |> Enum.into(@valid_attrs)
        |> MyComments.create_file()

      file
    end

    test "list_files/0 returns all files" do
      file = file_fixture()
      assert MyComments.list_files() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert MyComments.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      assert {:ok, %File{} = file} = MyComments.create_file(@valid_attrs)
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MyComments.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      assert {:ok, %File{} = file} = MyComments.update_file(file, @update_attrs)
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = MyComments.update_file(file, @invalid_attrs)
      assert file == MyComments.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = MyComments.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> MyComments.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = MyComments.change_file(file)
    end
  end
end
