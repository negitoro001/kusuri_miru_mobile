defmodule KusuriMiruMobile.DrugListsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KusuriMiruMobile.DrugLists` context.
  """

  @doc """
  Generate a drug_list.
  """
  def drug_list_fixture(attrs \\ %{}) do
    {:ok, drug_list} =
      attrs
      |> Enum.into(%{
        name: "some name",
        reviews: ["option1", "option2"]
      })
      |> KusuriMiruMobile.DrugLists.create_drug_list()

    drug_list
  end
end
