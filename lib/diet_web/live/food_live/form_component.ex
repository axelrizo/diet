defmodule DietWeb.FoodLive.FormComponent do
  use DietWeb, :live_component

  alias Diet.Diets

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage food records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="food-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:carbohydrates]} type="text" label="Carbohydrates" />
        <.input field={@form[:fats]} type="text" label="Fats" />
        <.input field={@form[:proteins]} type="text" label="Proteins" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Food</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{food: food} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Diets.change_food(food))
     end)}
  end

  @impl true
  def handle_event("validate", %{"food" => food_params}, socket) do
    changeset = Diets.change_food(socket.assigns.food, food_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"food" => food_params}, socket) do
    save_food(socket, socket.assigns.action, food_params)
  end

  defp save_food(socket, :edit, food_params) do
    case Diets.update_food(socket.assigns.food, food_params) do
      {:ok, food} ->
        notify_parent({:saved, food})

        {:noreply,
         socket
         |> put_flash(:info, "Food updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_food(socket, :new, food_params) do
    case Diets.create_food(food_params) do
      {:ok, food} ->
        notify_parent({:saved, food})

        {:noreply,
         socket
         |> put_flash(:info, "Food created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
