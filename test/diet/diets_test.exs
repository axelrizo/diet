defmodule Diet.DietsTest do
  use Diet.DataCase, async: true

  doctest Diet.Diets

  alias Diet.Diets
  alias Diet.Diets.Food

  describe "create_food/1" do
    test "returns food and inserts it when given valid attributes" do
      attrs = params_for(:food)

      assert {:ok, %Food{}} = Diets.create_food(attrs)
      assert Repo.get_by(Food, name: attrs.name)
    end
  end

  describe "list_foods/0" do
    test "returns all foods" do
      foods = insert_list(3, :food)

      assert returned_foods = Diets.list_foods()
      for food <- foods, do: %Food{} |> match?(food) |> assert()
      assert length(returned_foods) == length(foods)
    end
  end

  describe "get_food!/1" do
    test "returns the food when it exists" do
      food = insert(:food)

      assert %Food{} = returned_food = Diets.get_food!(food.id)
      assert returned_food.id == food.id
      assert returned_food.name == food.name
    end

    test "raises Ecto.NoResultsError when food does not exist" do
      assert_raise Ecto.NoResultsError, fn ->
        Diets.get_food!(999_999)
      end
    end
  end

  describe "change_food/2" do
    test "returns a food changeset when a food struct" do
      food = insert(:food)

      assert %Ecto.Changeset{} = changeset = Diets.change_food(food)
      assert changeset.data == food
    end

    test "returns a food changeset when attributes" do
      food = insert(:food)
      new_attrs = params_for(:food, name: "New Food Name")

      assert %Ecto.Changeset{} = changeset = Diets.change_food(food, new_attrs)
      assert changeset.changes.name == "New Food Name"
    end
  end

  describe "update_food/2" do
    test "updates the food when valid attributes" do
      food = insert(:food)
      update_attrs = params_for(:food, name: "Updated Food")

      assert {:ok, %Food{} = updated_food} = Diets.update_food(food, update_attrs)
      assert updated_food.name == "Updated Food"
      assert Decimal.eq?(updated_food.carbohydrates, update_attrs.carbohydrates)
      assert Decimal.eq?(updated_food.fats, update_attrs.fats)
      assert Decimal.eq?(updated_food.proteins, update_attrs.proteins)
    end

    test "returns error changeset when invalid attributes" do
      food = insert(:food)
      invalid_attrs = %{name: nil, carbohydrates: nil, fats: nil, proteins: nil}

      assert {:error, %Ecto.Changeset{} = changeset} = Diets.update_food(food, invalid_attrs)
      assert "can't be blank" in errors_on(changeset).name
    end
  end
end
