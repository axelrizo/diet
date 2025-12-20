defmodule DietWeb.FoodLive.New do
  @moduledoc """
  LiveView for creating a new food item.
  """

  use DietWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1 data-test-id="header">New Food</h1>
    <form phx-submit="create">
      <label for="food_name">Name</label>
      <input id="food_name" name="" />
      <label for="food_carbohydrates">Carbohydrates</label>
      <input id="food_carbohydrates" name="" />
      <label for="food_fats">Fats</label>
      <input id="food_fats" name="" />
      <label for="food_proteins">Proteins</label>
      <input id="food_proteins" name="" />
      <button type="submit">Create Food</button>
    </form>
    """
  end

  @impl Phoenix.LiveView
  def handle_event("create", _params, socket) do
    {:noreply,
     socket
     |> put_flash(:info, ~s(Food "Orange" created successfully))
     |> push_navigate(to: ~p"/foods")}
  end
end
