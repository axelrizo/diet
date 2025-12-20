defmodule DietWeb.FoodLive.Index do
  use DietWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Food Index</h1>
    """
  end
end
