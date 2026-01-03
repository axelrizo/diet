defmodule Diet.Diets do
  alias Diet.Diets.Food

  def create_food(attrs) do
    %Food{}
    |> Food.changeset(attrs)
    |> Diet.Repo.insert()
  end
end
