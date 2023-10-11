defmodule KusuriMiruMobile.TopsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KusuriMiruMobile.Tops` context.
  """

  @doc """
  Generate a top.
  """
  def top_fixture(attrs \\ %{}) do
    {:ok, top} =
      attrs
      |> Enum.into(%{
        icon: "some icon",
        id: "some id",
        name: "some name",
        tags: ["option1", "option2"]
      })
      |> KusuriMiruMobile.Tops.create_top()

    top
  end
end
