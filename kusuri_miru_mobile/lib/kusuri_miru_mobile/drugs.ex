defmodule KusuriMiruMobile.Drugs do
  @moduledoc """
  The Drugs context.
  """

  import Ecto.Query, warn: false
  alias KusuriMiruMobile.Repo

  alias KusuriMiruMobile.Drugs.Drug

  @doc """
  Returns the list of drugs.

  ## Examples

      iex> list_drugs()
      [%Drug{}, ...]

  """
  def list_drugs do
    Repo.all(Drug)
  end

  @doc """
  Gets a single drug.

  Raises `Ecto.NoResultsError` if the Drug does not exist.

  ## Examples

      iex> get_drug!(123)
      %Drug{}

      iex> get_drug!(456)
      ** (Ecto.NoResultsError)

  """
  def get_drug!(id) do
    attr =
    Req.get!("https://kusuri-miru-api-4b3a54cvqq-an.a.run.app/drugs/#{id}")
    |> Map.get(:body)
    |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)

    struct(Drug, attr)
    #|> Enum.sort_by(& &1.count_ratings, :desc)
  end

  @doc """
  Creates a drug.

  ## Examples

      iex> create_drug(%{field: value})
      {:ok, %Drug{}}

      iex> create_drug(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_drug(attrs \\ %{}) do
    %Drug{}
    |> Drug.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a drug.

  ## Examples

      iex> update_drug(drug, %{field: new_value})
      {:ok, %Drug{}}

      iex> update_drug(drug, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_drug(%Drug{} = drug, attrs) do
    drug
    |> Drug.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a drug.

  ## Examples

      iex> delete_drug(drug)
      {:ok, %Drug{}}

      iex> delete_drug(drug)
      {:error, %Ecto.Changeset{}}

  """
  def delete_drug(%Drug{} = drug) do
    Repo.delete(drug)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking drug changes.

  ## Examples

      iex> change_drug(drug)
      %Ecto.Changeset{data: %Drug{}}

  """
  def change_drug(%Drug{} = drug, attrs \\ %{}) do
    Drug.changeset(drug, attrs)
  end
end
