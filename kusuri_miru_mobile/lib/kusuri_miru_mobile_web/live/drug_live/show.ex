defmodule KusuriMiruMobileWeb.DrugLive.Show do
  use KusuriMiruMobileWeb, :live_view

  alias KusuriMiruMobile.Drugs

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:drug, Drugs.get_drug!(id))}
  end

  defp page_title(:show), do: "Show Drug"
  defp page_title(:edit), do: "Edit Drug"
end
