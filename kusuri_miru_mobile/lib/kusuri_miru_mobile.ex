defmodule KusuriMiruMobile do
  @moduledoc """
  KusuriMiruMobile keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  use Application

  def config_dir() do
    Path.join([Desktop.OS.home(), ".config", "kusuri_miru_mobile"])
  end

  @app Mix.Project.config()[:app]
  def start(:normal, []) do
    File.mkdir_p!(config_dir())
    # DBの設定
    #Application.put_env(:kusuri_miru_mobile, KusuriMiruMobile.Repo,
    #  database: Path.join(config_dir())
    #)

    :session = :ets.new(:session, [:named_table, :public, read_concurrency: true])

    children = [
    #  KusuriMiruMobile.Repo,
      {Phoenix.PubSub, name: KusuriMiruMobile.PubSub},
      KusuriMiruMobileWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: KusuriMiruMobile.Supervisor]

    {:ok, sup} = Supervisor.start_link(children, opts)
    port = :ranch.get_port(KusuriMiruMobileWeb.Endpoint.HTTP)

    {:ok, _} =
      Supervisor.start_child(sup, {
        Desktop.Window,
        [
          app: @app,
          id: KusuriMiruMobileWindow,
          title: "Kusuri_miru_mobile",
          size: {400, 800},
          url: "http://localhost:#{port}"
        ]
      })
  end

  def config_change(changed, _new, removed) do
    KusuriMiruMobileWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
