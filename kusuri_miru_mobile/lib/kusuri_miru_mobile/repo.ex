defmodule KusuriMiruMobile.Repo do
  use Ecto.Repo,
    otp_app: :kusuri_miru_mobile,
    adapter: Ecto.Adapters.SQLite3
  def initialize() do
    Req.new(base_url: System.get_env("API_BASE_URL"))
  end
end
