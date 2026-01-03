defmodule DietWeb.FoodLive.New do
  @moduledoc """
  LiveView for creating a new food item.
  """

  use DietWeb, :live_view

  alias Diet.Diets
  alias Diet.Diets.Food

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <h1 data-test-id="header">New Food</h1>

    <.simple_form for={@changeset} phx-submit="create">
      <.input field={@changeset[:name]} label="Name" />
      <.input field={@changeset[:carbohydrates]} label="Carbohydrates" type="number" />
      <.input field={@changeset[:fats]} label="Fats" type="number" />
      <.input field={@changeset[:proteins]} label="Proteins" type="number" />
      <.button type="submit">Create Food</.button>
    </.simple_form>
    """
  end

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    changeset = Food.changeset(%Food{}, %{})
    {:ok, assign(socket, :changeset, to_form(changeset))}
  end

  @impl Phoenix.LiveView
  def handle_event("create", %{"food" => food_params}, socket) do
    case Diets.create_food(food_params) do
      {:ok, food} ->
        {:noreply,
         socket
         |> put_flash(:info, ~s(Food "#{food.name}" created successfully))
         |> redirect(to: ~p"/foods")}

      {:error, changeset} ->
        {:noreply, assign(socket, :changeset, to_form(changeset))}
    end
  end
end
