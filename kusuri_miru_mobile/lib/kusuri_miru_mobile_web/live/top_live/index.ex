defmodule KusuriMiruMobileWeb.TopLive.Index do
  use KusuriMiruMobileWeb, :live_view

  alias KusuriMiruMobile.Tops
  alias KusuriMiruMobile.Tops.Top

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tops, Tops.list_tops())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Top")
    |> assign(:top, Tops.get_top!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Top")
    |> assign(:top, %Top{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tops")
    |> assign(:top, nil)
  end

  @impl true
  def handle_info({KusuriMiruMobileWeb.TopLive.FormComponent, {:saved, top}}, socket) do
    {:noreply, stream_insert(socket, :tops, top)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    top = Tops.get_top!(id)
    {:ok, _} = Tops.delete_top(top)

    {:noreply, stream_delete(socket, :tops, top)}
  end
end
