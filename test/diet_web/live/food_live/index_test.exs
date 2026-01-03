defmodule DietWeb.FoodLive.IndexTest do
  use DietWeb.ConnCase, async: true

  describe "GET /foods" do
    test "renders the food list", %{conn: conn} do
      foods = insert_list(2, :food)

      conn
      |> visit(~p"/foods")
      |> assert_has("#foods-list tr", count: length(foods))
      |> assert_has("#foods-list td", text: get_in(foods, [Access.at(0)]).name)
      |> assert_has("#foods-list td", text: get_in(foods, [Access.at(1)]).name)
    end
  end
end
