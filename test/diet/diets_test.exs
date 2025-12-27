defmodule Diet.DietsTest do
  use Diet.DataCase, async: true

  alias Diet.Diets
  alias Diet.Diets.Food

  describe "create_food/1" do
    test "returns food and inserts it" do
      attrs = params_for(:food)

      assert {:ok, %Food{}} = Diets.create_food(attrs)
      assert Repo.get_by(Food, name: attrs.name)
    end
  end
end
