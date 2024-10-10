defmodule KusuriMiruMobile.Words.Word do
  use Ecto.Schema
  import Ecto.Changeset

  schema "words" do
    field(:word, :string)
  end

  @doc false
  def changeset(word, attrs) do
    word
    |> cast(attrs, [:word, :id])
    |> validate_required([:word, :id])
  end
end
