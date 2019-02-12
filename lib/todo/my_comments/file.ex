defmodule Todo.MyComments.File do
  use Ecto.Schema
  import Ecto.Changeset


  schema "files" do
    field :name, :string
    field :viewcount, :integer
    field :published, :boolean
    
    belongs_to :comments, Todo.MyComments.Comment 
    timestamps()
  end

  @doc false
  def changeset(file, attrs) do
    file
    |> cast(attrs, [:comments_id, :name, :viewcount, :published])
    |> validate_required([:name])
  end
end
