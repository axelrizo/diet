defmodule DietWeb.FoodLive.NewTest do
  use DietWeb.ConnCase, async: true

  describe "GET /foods/new" do
    test "renders the new food page", %{conn: conn} do
      conn
      |> visit(~p"/foods/new")
      |> assert_has(test_id("header"), text: "New Food")
    end

    test "shows a flash and redirect to '/foods' when upload a new food", %{conn: conn} do
      food_name = "Orange"

      conn
      |> visit(~p"/foods/new")
      |> fill_in("Name", with: food_name)
      |> fill_in("Carbohydrates", with: "15")
      |> fill_in("Fats", with: "5")
      |> fill_in("Proteins", with: "2")
      |> click_button("Create Food")
      |> assert_has("#flash-info", text: ~s(Food "#{food_name}" created successfully))
      |> assert_path(~p"/foods")
    end
  end
end
