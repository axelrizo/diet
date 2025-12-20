defmodule Diet.Diets.FoodTest do
  use Diet.DataCase, async: true

  alias Diet.Diets.Food
  alias Ecto.Changeset

  describe "changeset/2" do
    test "return food when valid attrs" do
      attrs = %{name: "Apple", carbohydrates: 10, fats: 20, proteins: 30}

      {:ok, food} = %Food{} |> Food.changeset(attrs) |> Changeset.apply_action(:validate)

      assert food.name == attrs.name
      assert food.carbohydrates == attrs.carbohydrates
      assert food.fats == attrs.fats
      assert food.proteins == attrs.proteins
    end

    for field <- [:carbohydrates, :fats, :proteins, :name] do
      @field field

      test "return invalid changeset when no #{@field}" do
        attrs = %{name: "Banana", carbohydrates: 10, fats: 20, proteins: 30} |> Map.delete(@field)

        changeset = Food.changeset(%Food{}, attrs)

        assert changeset.valid? == false
        assert ["can't be blank"] = errors_on(changeset)[@field]
      end
    end
  end
end
