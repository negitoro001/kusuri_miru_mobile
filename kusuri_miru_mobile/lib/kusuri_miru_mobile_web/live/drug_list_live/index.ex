defmodule KusuriMiruMobileWeb.DrugListLive.Index do
  use KusuriMiruMobileWeb, :live_view

  alias KusuriMiruMobile.DrugLists
  alias KusuriMiruMobile.DrugLists.DrugList

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :druglists, DrugLists.list_druglists())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Drug list")
    |> assign(:drug_list, DrugLists.get_drug_list!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Drug list")
    |> assign(:drug_list, %DrugList{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Druglists")
    |> assign(:drug_list, nil)
  end

  @impl true
  def handle_info({KusuriMiruMobileWeb.DrugListLive.FormComponent, {:saved, drug_list}}, socket) do
    {:noreply, stream_insert(socket, :druglists, drug_list)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    drug_list = DrugLists.get_drug_list!(id)
    {:ok, _} = DrugLists.delete_drug_list(drug_list)

    {:noreply, stream_delete(socket, :druglists, drug_list)}
  end
end
