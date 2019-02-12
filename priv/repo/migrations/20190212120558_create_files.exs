defmodule Todo.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files) do
      add :comment_id, references(:comments)
      add :name, :string
      add :viewcount, :integer
      add :published, :boolean, default: false
      timestamps()
    end
  end
end
