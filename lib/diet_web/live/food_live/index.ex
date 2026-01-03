defmodule DietWeb.FoodLive.Index do
  use DietWeb, :live_view

  alias Diet.Diets

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:foods, Diets.list_foods())}
  end

  def render(assigns) do
    ~H"""
    <h1>Food Index</h1>
    <.table id="foods-list" rows={@foods}>
      <:col :let={food} label="id">{food.id}</:col>
      <:col :let={food} label="name">{food.name}</:col>
      <:col :let={food} label="proteins">{food.proteins}</:col>
      <:col :let={food} label="fats">{food.fats}</:col>
      <:col :let={food} label="carbohydrates">{food.carbohydrates}</:col>
    </.table>
    """
  end
end
