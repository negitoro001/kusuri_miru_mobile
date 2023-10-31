defmodule KusuriMiruMobile.DrugLists do
  @moduledoc """
  The DrugLists context.
  """

  import Ecto.Query, warn: false
  alias KusuriMiruMobile.Repo

  alias KusuriMiruMobile.DrugLists.DrugList

  @doc """
  Returns the list of druglists.

  ## Examples

      iex> list_druglists()
      [%DrugList{}, ...]

  """
  def list_druglists do
    Repo.all(DrugList)
  end

  @doc """
  Gets a single drug_list.

  Raises `Ecto.NoResultsError` if the Drug list does not exist.

  ## Examples

      iex> get_drug_list!(123)
      %DrugList{}

      iex> get_drug_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_drug_list!(id) do
    Req.get!("https://kusuri-miru-api-4b3a54cvqq-an.a.run.app/categories/get/#{id}")
    |> Map.get(:body)
    |> Map.get("drugs")
    |> Enum.map(fn drug ->
      %DrugList{
        id: drug["id"],
        name: drug["name"],
        medicine_type: drug["medicine_type"],
        avg_rating: drug["avg_rating"],
        count_ratings: drug["count_ratings"],
        breadcrumb_list: drug["breadcrumb_list"],
        another_name: drug["another_name"] |> Enum.at(0),
        text: drug["content"]["effects"]["text"],
        tags: drug["tags"],
        created_at: drug["created_at"]
      }
    end)
    |> Enum.sort_by(&(&1.count_ratings), :desc)
  end

  @doc """
  Creates a drug_list.

  ## Examples

      iex> create_drug_list(%{field: value})
      {:ok, %DrugList{}}

      iex> create_drug_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_drug_list(attrs \\ %{}) do
    %DrugList{}
    |> DrugList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a drug_list.

  ## Examples

      iex> update_drug_list(drug_list, %{field: new_value})
      {:ok, %DrugList{}}

      iex> update_drug_list(drug_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_drug_list(%DrugList{} = drug_list, attrs) do
    drug_list
    |> DrugList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a drug_list.

  ## Examples

      iex> delete_drug_list(drug_list)
      {:ok, %DrugList{}}

      iex> delete_drug_list(drug_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_drug_list(%DrugList{} = drug_list) do
    Repo.delete(drug_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking drug_list changes.

  ## Examples

      iex> change_drug_list(drug_list)
      %Ecto.Changeset{data: %DrugList{}}

  """
  def change_drug_list(%DrugList{} = drug_list, attrs \\ %{}) do
    DrugList.changeset(drug_list, attrs)
  end
end
