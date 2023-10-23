defmodule KusuriMiruMobile.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KusuriMiruMobile.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    category = KusuriMiruMobile.Categories.get_category!(attrs)
    {:ok, category}
  end
end
