defmodule Diet.DietsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Diet.Diets` context.
  """

  @doc """
  Generate a food.
  """
  def food_fixture(attrs \\ %{}) do
    {:ok, food} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Diet.Diets.create_food()

    food
  end
end
