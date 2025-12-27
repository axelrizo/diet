defmodule Diet.Diets.FoodTest do
  use Diet.DataCase, async: true

  alias Diet.Diets.Food
  alias Ecto.Changeset

  describe "changeset/2" do
    test "return food when valid attrs and validated" do
      attrs = params_for(:food)

      {:ok, food} = %Food{} |> Food.changeset(attrs) |> Changeset.apply_action(:validate)

      assert food.name == attrs.name
      assert Decimal.equal?(food.carbohydrates, Decimal.from_float(attrs.carbohydrates))
      assert Decimal.equal?(food.fats, Decimal.from_float(attrs.fats))
      assert Decimal.equal?(food.proteins, Decimal.from_float(attrs.proteins))
    end

    for field <- [:carbohydrates, :fats, :proteins, :name] do
      @field field

      test "return invalid changeset when no #{@field}" do
        attrs = params_for(:food, %{@field => nil})

        changeset = Food.changeset(%Food{}, attrs)

        assert changeset.valid? == false
        assert ["can't be blank"] = errors_on(changeset)[@field]
      end
    end

    for field <- [:carbohydrates, :fats, :proteins] do
      @field field

      test "return invalid changeset when #{@field} is negative" do
        attrs = params_for(:food, %{@field => -1})

        changeset = Food.changeset(%Food{}, attrs)

        assert changeset.valid? == false
        assert ["must be greater than or equal to 0"] = errors_on(changeset)[@field]
      end
    end
  end
end
