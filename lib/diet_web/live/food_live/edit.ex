defmodule DietWeb.FoodLive.Edit do
  use DietWeb, :live_view

  alias Ecto.Changeset
  alias Diet.Diets

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    food = Diets.get_food!(id)
    changeset = Diets.change_food(food)

    {:ok,
     socket
     |> assign(:page_title, "Edit Food")
     |> assign(:food, food)
     |> assign(:form, to_form(changeset))}
  end

  @impl true
  def handle_event("validate", %{"food" => food_params}, socket) do
    changeset =
      socket.assigns.food
      |> Diets.change_food(food_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  @impl true
  def handle_event("save", %{"food" => food_params}, socket) do
    case Diets.update_food(socket.assigns.food, food_params) do
      {:ok, _food} ->
        {:noreply,
         socket
         |> put_flash(:info, "Food updated successfully")
         |> push_navigate(to: ~p"/foods")}

      {:error, %Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <h1>Edit Food</h1>

      <.simple_form for={@form} id="food-form" phx-change="validate" phx-submit="save">
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:proteins]} type="number" label="Protein (g)" step="0.1" />
        <.input field={@form[:carbohydrates]} type="number" label="Carbs (g)" step="0.1" />
        <.input field={@form[:fats]} type="number" label="Fat (g)" step="0.1" />
        <:actions>
          <.button>Save</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end
end
