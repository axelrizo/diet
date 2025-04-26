defmodule DietWeb.FoodLive.Index do
  use DietWeb, :live_view

  alias Diet.Diets
  alias Diet.Diets.Food

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :food_collection, Diets.list_food())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Food")
    |> assign(:food, Diets.get_food!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Food")
    |> assign(:food, %Food{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Food")
    |> assign(:food, nil)
  end

  @impl true
  def handle_info({DietWeb.FoodLive.FormComponent, {:saved, food}}, socket) do
    {:noreply, stream_insert(socket, :food_collection, food)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    food = Diets.get_food!(id)
    {:ok, _} = Diets.delete_food(food)

    {:noreply, stream_delete(socket, :food_collection, food)}
  end
end
