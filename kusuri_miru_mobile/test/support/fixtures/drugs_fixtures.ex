defmodule KusuriMiruMobile.DrugsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KusuriMiruMobile.Drugs` context.
  """

  @doc """
  Generate a drug.
  """
  def drug_fixture(attrs \\ %{}) do
    {:ok, drug} =
      attrs
      |> Enum.into(%{
        comments: "some comments"
      })
      |> KusuriMiruMobile.Drugs.create_drug()

    drug
  end
end
