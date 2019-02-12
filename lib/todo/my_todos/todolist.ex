defmodule Todo.MyTodos.Todolist do
  use Ecto.Schema
  import Ecto.Changeset


  schema "todolist" do
    field :completed, :boolean, default: false
    field :item, :string

    timestamps()
  end

  @doc false
  def changeset(todolist, attrs) do
    todolist
    |> cast(attrs, [:item, :completed])
    |> validate_required([:item, :completed])
  end
end
