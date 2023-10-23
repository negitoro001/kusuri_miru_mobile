defmodule KusuriMiruMobile.TopsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KusuriMiruMobile.Tops` context.
  """

  @doc """
  Generate a top.
  """
  def top_fixture(_attrs \\ %{}) do
    KusuriMiruMobile.Tops.list_tops()
  end
end
