defmodule Todo.Repo.Migrations.CreateTodolist do
  use Ecto.Migration

  def change do
    create table(:todolist) do
      add :item, :string
      add :completed, :boolean, default: false, null: false

      timestamps()
    end

  end
end
