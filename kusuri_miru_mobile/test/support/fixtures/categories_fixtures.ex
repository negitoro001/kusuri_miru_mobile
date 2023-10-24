defmodule KusuriMiruMobile.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KusuriMiruMobile.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    attrs
    |> KusuriMiruMobile.Categories.get_category!()
  end
end
