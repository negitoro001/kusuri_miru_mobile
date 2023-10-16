defmodule KusuriMiruMobileWeb.TopBar do
  use Phoenix.Component

  attr(:title, :string, default: "")

  slot(:back, doc: "add back navigation within .link component")
  slot(:actions, doc: "add action navigation such as add, edit and etc... within .link component")

  def gheader(assigns) do
    ~H"""
    <div class="fixed navbar bg-orange-300 text-white w-full z-10 top-0 left-0">
      <div class="navbar-start">
        <span :if={@back != []} class="normal-case text-xl">
          <%= render_slot(@back) %>
        </span>
      </div>
      <div class="navbar-center">
        <span class="normal-case text-4xl">
          <%= @title %>
        </span>
      </div>
      <div class="navbar-end">
        <span :if={@actions != []} class="normal-case text-xl">
          <%= render_slot(@actions) %>
        </span>
      </div>
    </div>
    """
  end
end
