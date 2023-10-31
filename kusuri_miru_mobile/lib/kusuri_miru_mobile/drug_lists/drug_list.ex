defmodule KusuriMiruMobile.DrugLists.DrugList do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "druglists" do
    field :name, :string
    field :reviews, {:array, :string}
  end

  @doc false
  def changeset(drug_list, attrs) do
    drug_list
    |> cast(attrs, [:name, :reviews])
    |> validate_required([:name, :reviews])
  end
end
