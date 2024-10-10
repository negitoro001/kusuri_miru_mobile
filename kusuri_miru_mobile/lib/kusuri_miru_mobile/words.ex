defmodule KusuriMiruMobile.Words do
  @moduledoc """
  The words context.
  """

  import Ecto.Query, warn: false
  alias KusuriMiruMobile.Words
  alias KusuriMiruMobile.Repo

  alias KusuriMiruMobile.Words.Word

  @doc """
  Returns the list of words.

  ## Examples

      iex> list_words()
      [%Top{}, ...]

  """
  def list_words do
    [
      %Word{
        id: 1,
        word: "不眠"
      },
      %Word{
        id: 2,
        word: "頭痛"
      },
      %Word{
        id: 3,
        word: "肩こり"
      },
      %Word{
        id: 4,
        word: "慢性胃炎"
      },
      %Word{
        id: 5,
        word: "うつ"
      },
      %Word{
        id: 6,
        word: "躁うつ"
      },
      %Word{
        id: 7,
        word: "ADHD"
      },
      %Word{
        id: 8,
        word: "自律神経失調症"
      },
      %Word{
        id: 9,
        word: "かぜ"
      },
      %Word{
        id: 10,
        word: "喘息"
      },
      %Word{
        id: 11,
        word: "蕁麻疹"
      },
      %Word{
        id: 12,
        word: "せき"
      },
      %Word{
        id: 13,
        word: "筋肉痛"
      },
      %Word{
        id: 14,
        word: "鼻づまり"
      },
      %Word{
        id: 15,
        word: "生理痛"
      },
      %Word{
        id: 16,
        word: "胸やけ"
      },
      %Word{
        id: 17,
        word: "腹痛"
      },
      %Word{
        id: 18,
        word: "アトピー"
      }
    ]
  end
end
