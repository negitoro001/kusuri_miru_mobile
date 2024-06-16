defmodule KusuriMiruMobileWeb.DrugLive.Index do
  use KusuriMiruMobileWeb, :live_view

  alias KusuriMiruMobile.Drugs
  alias KusuriMiruMobile.Drugs.Drug

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :drugs, Drugs.list_drugs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Drug")
    |> assign(:drug, Drugs.get_drug!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Drug")
    |> assign(:drug, %Drug{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Drugs")
    |> assign(:drug, nil)
  end

  @impl true
  def handle_info({KusuriMiruMobileWeb.DrugLive.FormComponent, {:saved, drug}}, socket) do
    {:noreply, stream_insert(socket, :drugs, drug)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    drug = Drugs.get_drug!(id)
    {:ok, _} = Drugs.delete_drug(drug)

    {:noreply, stream_delete(socket, :drugs, drug)}
  end
end
