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
      },
      %Top{
        id: 3,
        name: "呼吸器",
        icon: "lung.svg",
        category_id: "e3347",
        tags: ["インフルエンザ", "せき", "気管支炎", "気管支喘息"]
      },
      %Top{
        id: 4,
        name: "脳・神経",
        icon: "brain.svg",
        category_id: "e1e76",
        tags: ["ADHD", "ナルコレプシー", "パニック障害", "不眠症"]
      },
      %Top{
        id: 5,
        name: "皮膚",
        icon: "hand.svg",
        category_id: "d5767",
        tags: ["そう痒", "湿疹", "皮膚炎", "蕁麻疹", "ヘルペス"]
      },
      %Top{
        id: 6,
        name: "食道・胃・腸",
        icon: "stomach.svg",
        category_id: "ff698",
        tags: ["胃潰瘍", "逆流性食道炎", "胸やけ", "腹痛"]
      },
      %Top{
        id: 7,
        name: "目",
        icon: "eye.svg",
        category_id: "68549",
        tags: ["アレルギー性結膜炎", "なみだ目"]
      },
      %Top{
        id: 8,
        name: "鼻",
        icon: "nose.svg",
        category_id: "46521",
        tags: ["アレルギー性鼻炎", "鼻づまり", "花粉症"]
      },
      %Top{
        id: 9,
        name: "のど",
        icon: "throat.svg",
        category_id: "4cc58",
        tags: ["のどのはれや痛み", "かぜ", "逆流性食道炎"]
      },
      %Top{
        id: 10,
        name: "女性の病気",
        icon: "woman.svg",
        category_id: "3ebf5",
        tags: ["生理痛", "PMS", "低用量ピル"]
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
