defmodule KusuriMiruMobileWeb.DrugLive.FormComponent do
  use KusuriMiruMobileWeb, :live_component

  alias KusuriMiruMobile.Drugs

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage drug records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="drug-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:comments]} type="text" label="Comments" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Drug</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{drug: drug} = assigns, socket) do
    changeset = Drugs.change_drug(drug)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"drug" => drug_params}, socket) do
    changeset =
      socket.assigns.drug
      |> Drugs.change_drug(drug_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"drug" => drug_params}, socket) do
    save_drug(socket, socket.assigns.action, drug_params)
  end

  defp save_drug(socket, :edit, drug_params) do
    case Drugs.update_drug(socket.assigns.drug, drug_params) do
      {:ok, drug} ->
        notify_parent({:saved, drug})

        {:noreply,
         socket
         |> put_flash(:info, "Drug updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_drug(socket, :new, drug_params) do
    case Drugs.create_drug(drug_params) do
      {:ok, drug} ->
        notify_parent({:saved, drug})

        {:noreply,
         socket
         |> put_flash(:info, "Drug created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
