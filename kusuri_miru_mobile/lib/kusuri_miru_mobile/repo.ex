defmodule KusuriMiruMobile.Repo do
  use Ecto.Repo,
    otp_app: :kusuri_miru_mobile,
    adapter: Ecto.Adapters.SQLite3
  def initialize() do

  end
end
