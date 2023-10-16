defmodule KusuriMiruMobile.Tops.Top do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tops" do
    field :icon, :string
    field :category_id, :string
    field :name, :string
    field :tags, {:array, :string}
  end

  @doc false
  def changeset(top, attrs) do
    top
    |> cast(attrs, [:name, :icon, :id, :tags])
    |> validate_required([:name, :icon, :id, :tags])
  end
end
