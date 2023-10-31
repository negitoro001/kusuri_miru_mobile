defmodule KusuriMiruMobileWeb.DrugListLive.FormComponent do
  use KusuriMiruMobileWeb, :live_component

  alias KusuriMiruMobile.DrugLists

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage drug_list records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="drug_list-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input
          field={@form[:reviews]}
          type="select"
          multiple
          label="Reviews"
          options={[{"Option 1", "option1"}, {"Option 2", "option2"}]}
        />
        <:actions>
          <.button phx-disable-with="Saving...">Save Drug list</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{drug_list: drug_list} = assigns, socket) do
    changeset = DrugLists.change_drug_list(drug_list)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"drug_list" => drug_list_params}, socket) do
    changeset =
      socket.assigns.drug_list
      |> DrugLists.change_drug_list(drug_list_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"drug_list" => drug_list_params}, socket) do
    save_drug_list(socket, socket.assigns.action, drug_list_params)
  end

  defp save_drug_list(socket, :edit, drug_list_params) do
    case DrugLists.update_drug_list(socket.assigns.drug_list, drug_list_params) do
      {:ok, drug_list} ->
        notify_parent({:saved, drug_list})

        {:noreply,
         socket
         |> put_flash(:info, "Drug list updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_drug_list(socket, :new, drug_list_params) do
    case DrugLists.create_drug_list(drug_list_params) do
      {:ok, drug_list} ->
        notify_parent({:saved, drug_list})

        {:noreply,
         socket
         |> put_flash(:info, "Drug list created successfully")
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
