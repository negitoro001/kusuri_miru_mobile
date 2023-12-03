defmodule KusuriMiruMobile.Drugs.Drug do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "drugs" do
    field :comments, :string
    field :name, :string
    field :medicine_type, :string
    field :avg_rating, :float
    field :count_ratings, :integer
    field :breadcrumb_list, {:array, :string}
    field :another_name, :string
    field :text, :string
    field :tags, {:array, :string}
    field :updated_at, :naive_datetime

  end

  @doc false
  def changeset(drug, attrs) do
    drug
    |> cast(attrs, [:comments])
    |> validate_required([:comments])
  end
end
