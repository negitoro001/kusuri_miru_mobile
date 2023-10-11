defmodule KusuriMiruMobile.Repo.Migrations.CreateTops do
  use Ecto.Migration

  def change do
    create table(:tops) do
      add :name, :string
      add :icon, :string
      add :id, :string
      add :tags, {:array, :string}

      timestamps()
    end
  end
end
