defmodule Diet.DietsTest do
  use Diet.DataCase

  alias Diet.Diets

  describe "food" do
    alias Diet.Diets.Food

    import Diet.DietsFixtures

    @invalid_attrs %{name: nil}

    test "list_food/0 returns all food" do
      food = food_fixture()
      assert Diets.list_food() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Diets.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Food{} = food} = Diets.create_food(valid_attrs)
      assert food.name == "some name"
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Diets.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Food{} = food} = Diets.update_food(food, update_attrs)
      assert food.name == "some updated name"
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Diets.update_food(food, @invalid_attrs)
      assert food == Diets.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Diets.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Diets.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Diets.change_food(food)
    end
  end
end
