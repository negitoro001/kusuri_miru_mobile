defmodule KusuriMiruMobileWeb.Router do
  use KusuriMiruMobileWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {KusuriMiruMobileWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KusuriMiruMobileWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/tops", TopLive.Index, :index
    live "/tops/new", TopLive.Index, :new
    live "/tops/:id/edit", TopLive.Index, :edit

    live "/tops/:id", TopLive.Show, :show
    live "/tops/:id/show/edit", TopLive.Show, :edit

    live "/categories", CategoryLive.Index, :index
    live "/categories/new", CategoryLive.Index, :new
    live "/categories/:id/edit", CategoryLive.Index, :edit

    live "/categories/:id", CategoryLive.Show, :show
    live "/categories/:id/show/edit", CategoryLive.Show, :edit

    live "/druglists", DrugListLive.Index, :index
    live "/druglists/new", DrugListLive.Index, :new
    live "/druglists/:id/edit", DrugListLive.Index, :edit

    live "/druglists/:id", DrugListLive.Show, :show
    live "/druglists/:id/show/edit", DrugListLive.Show, :edit

    live "/drug/:id", DrugLive.Show, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", KusuriMiruMobileWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kusuri_miru_mobile, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: KusuriMiruMobileWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
