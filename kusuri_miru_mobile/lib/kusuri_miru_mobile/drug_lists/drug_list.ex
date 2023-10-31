defmodule KusuriMiruMobile.DrugLists.DrugList do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "druglists" do
    field :name, :string
    field :medicine_type, :string
    field :avg_rating, :float
    field :count_ratings, :integer
    field :breadcrumb_list, {:array, :string}
    field :another_name, :string
    field :text, :string
    field :tags, {:array, :string}
  end

  @doc false
  def changeset(drug_list, attrs) do
    drug_list
    |> cast(attrs, [:name, :breadcrumb_list])
    |> validate_required([:name, :breadcrumb_list])
  end
end
