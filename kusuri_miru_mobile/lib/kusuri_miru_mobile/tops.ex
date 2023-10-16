defmodule KusuriMiruMobile.Tops do
  @moduledoc """
  The Tops context.
  """

  import Ecto.Query, warn: false
  alias KusuriMiruMobile.Repo

  alias KusuriMiruMobile.Tops.Top

  @doc """
  Returns the list of tops.

  ## Examples

      iex> list_tops()
      [%Top{}, ...]

  """
  def list_tops do
    [
      %Top{
        id: 1,
        name: "うつ・こころ",
        icon: "heart.svg",
        category_id: "fedb0",
        tags: [
          "うつ病",
          "自律神経失調症",
          "躁うつ病",
          "ナルコレプシー",
          "社会不安障害"
        ]
      },
      %Top{
        id: 2,
        name: "アレルギー",
        icon: "allergy.svg",
        category_id: "d0f58",
        tags: [
          "花粉症",
          "アレルギー性結膜炎",
          "アレルギー性鼻炎",
          "アトピー性皮膚炎"
        ]
      }
    ]
  end

  @doc """
  Gets a single top.

  Raises `Ecto.NoResultsError` if the Top does not exist.

  ## Examples

      iex> get_top!(123)
      %Top{}

      iex> get_top!(456)
      ** (Ecto.NoResultsError)

  """
  def get_top!(id), do: Repo.get!(Top, id)

  @doc """
  Creates a top.

  ## Examples

      iex> create_top(%{field: value})
      {:ok, %Top{}}

      iex> create_top(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_top(attrs \\ %{}) do
    %Top{}
    |> Top.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a top.

  ## Examples

      iex> update_top(top, %{field: new_value})
      {:ok, %Top{}}

      iex> update_top(top, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_top(%Top{} = top, attrs) do
    top
    |> Top.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a top.

  ## Examples

      iex> delete_top(top)
      {:ok, %Top{}}

      iex> delete_top(top)
      {:error, %Ecto.Changeset{}}

  """
  def delete_top(%Top{} = top) do
    Repo.delete(top)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking top changes.

  ## Examples

      iex> change_top(top)
      %Ecto.Changeset{data: %Top{}}

  """
  def change_top(%Top{} = top, attrs \\ %{}) do
    Top.changeset(top, attrs)
  end
end
