defmodule Diet.Diets do
  alias Diet.Diets.Food
  alias Diet.Repo

  def list_foods do
    Repo.all(Food)
  end

  def create_food(attrs) do
    %Food{}
    |> Food.changeset(attrs)
    |> Repo.insert()
  end
end
