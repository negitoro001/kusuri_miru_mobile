defmodule KusuriMiruMobile.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :category_name, :string

      timestamps()
    end
  end
end
