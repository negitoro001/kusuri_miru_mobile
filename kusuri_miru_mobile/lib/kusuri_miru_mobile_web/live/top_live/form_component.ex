defmodule KusuriMiruMobileWeb.TopLive.FormComponent do
  use KusuriMiruMobileWeb, :live_component

  alias KusuriMiruMobile.Tops

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage top records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="top-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:icon]} type="text" label="Icon" />
        <.input field={@form[:id]} type="text" label="Id" />
        <.input
          field={@form[:tags]}
          type="select"
          multiple
          label="Tags"
          options={[{"Option 1", "option1"}, {"Option 2", "option2"}]}
        />
        <:actions>
          <.button phx-disable-with="Saving...">Save Top</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{top: top} = assigns, socket) do
    changeset = Tops.change_top(top)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"top" => top_params}, socket) do
    changeset =
      socket.assigns.top
      |> Tops.change_top(top_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"top" => top_params}, socket) do
    save_top(socket, socket.assigns.action, top_params)
  end

  defp save_top(socket, :edit, top_params) do
    case Tops.update_top(socket.assigns.top, top_params) do
      {:ok, top} ->
        notify_parent({:saved, top})

        {:noreply,
         socket
         |> put_flash(:info, "Top updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_top(socket, :new, top_params) do
    case Tops.create_top(top_params) do
      {:ok, top} ->
        notify_parent({:saved, top})

        {:noreply,
         socket
         |> put_flash(:info, "Top created successfully")
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
