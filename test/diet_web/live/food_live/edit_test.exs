defmodule DietWeb.FoodLive.EditTest do
  use DietWeb.ConnCase, async: true

  describe "GET /foods/:id/edit" do
    test "renders the edit form with the selected food", %{conn: conn} do
      food = insert(:food)

      conn
      |> visit(~p"/foods/#{food.id}/edit")
      |> assert_has("h1", text: "Edit Food")
      |> assert_has("input[name='food[name]'][value='#{food.name}']")
      |> assert_has("input[name='food[proteins]']")
      |> assert_has("input[name='food[carbohydrates]']")
      |> assert_has("input[name='food[fats]']")
    end

    test "updates food with valid data", %{conn: conn} do
      food = insert(:food, name: "Apple")

      conn
      |> visit(~p"/foods/#{food.id}/edit")
      |> fill_in("Name", with: "Orange")
      |> click_button("Save")
      |> assert_has("#flash-info", text: "Food updated successfully")
      |> assert_path(~p"/foods")
    end

    test "shows validation errors with invalid data", %{conn: conn} do
      food = insert(:food, name: "Apple")

      conn
      |> visit(~p"/foods/#{food.id}/edit")
      |> fill_in("Name", with: "")
      |> click_button("Save")
      |> assert_has(test_id("error"), text: "can't be blank")
    end
  end
end
