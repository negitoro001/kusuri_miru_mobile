defmodule KusuriMiruMobile.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :category_name])
    |> validate_required([:name, :category_name])
  end
end
