defmodule Todo.MyTodos do
  @moduledoc """
  The MyTodos context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.MyTodos.Todolist

  @doc """
  Returns the list of todolist.

  ## Examples

      iex> list_todolist()
      [%Todolist{}, ...]

  """
  def list_todolist do
    Repo.all(Todolist)
  end

  @doc """
  Gets a single todolist.

  Raises `Ecto.NoResultsError` if the Todolist does not exist.

  ## Examples

      iex> get_todolist!(123)
      %Todolist{}

      iex> get_todolist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todolist!(id), do: Repo.get!(Todolist, id)

  @doc """
  Creates a todolist.

  ## Examples

      iex> create_todolist(%{field: value})
      {:ok, %Todolist{}}

      iex> create_todolist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todolist(attrs \\ %{}) do
    %Todolist{}
    |> Todolist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todolist.

  ## Examples

      iex> update_todolist(todolist, %{field: new_value})
      {:ok, %Todolist{}}

      iex> update_todolist(todolist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todolist(%Todolist{} = todolist, attrs) do
    todolist
    |> Todolist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Todolist.

  ## Examples

      iex> delete_todolist(todolist)
      {:ok, %Todolist{}}

      iex> delete_todolist(todolist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todolist(%Todolist{} = todolist) do
    Repo.delete(todolist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todolist changes.

  ## Examples

      iex> change_todolist(todolist)
      %Ecto.Changeset{source: %Todolist{}}

  """
  def change_todolist(%Todolist{} = todolist) do
    Todolist.changeset(todolist, %{})
  end
end
