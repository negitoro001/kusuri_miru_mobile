defmodule KusuriMiruMobileWeb.DrugListLive.Show do
  use KusuriMiruMobileWeb, :live_view

  alias KusuriMiruMobile.DrugLists

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:drug_list, DrugLists.get_drug_list!(id))}
  end

  @impl true
  def handle_event("sort_option", params, socket) do
    sort = params["name"]
    socket = assign(socket, :drug_list, socket.assigns.drug_list |> Enum.sort_by(& &1.sort, :desc))
    {:noreply, socket}
  end

  defp page_title(:show), do: "Show Drug list"
  defp page_title(:edit), do: "Edit Drug list"
end
