defmodule Diet.Diets do
  @moduledoc """
  The Diets context.

  This module provides functions for managing food items in the diet application.
  """

  alias Diet.Diets.Food
  alias Diet.Repo

  @doc """
  Returns the list of all foods.

  ## Examples

      iex> Diet.Diets.list_foods()
      []

  """
  @spec list_foods() :: [Food.t()]
  def list_foods do
    Repo.all(Food)
  end

  @doc """
  Gets a single food by ID.

  Raises `Ecto.NoResultsError` if the Food does not exist.

  ## Examples

      iex> {:ok, food} = Diet.Diets.create_food(%{name: "Apple", carbohydrates: 25, fats: 0.3, proteins: 0.5})
      iex> Diet.Diets.get_food!(food.id).name
      "Apple"

  """
  @spec get_food!(integer()) :: Food.t()
  def get_food!(id) do
    Repo.get!(Food, id)
  end

  @doc """
  Creates a food with the given attributes.

  ## Examples

      iex> {:ok, %Diet.Diets.Food{} = food} = Diet.Diets.create_food(%{name: "Banana", carbohydrates: 23, fats: 0.3, proteins: 1.1})
      iex> food.name
      "Banana"

      iex> {:error, %Ecto.Changeset{}} = Diet.Diets.create_food(%{name: nil})

  """
  @spec create_food(map()) :: {:ok, Food.t()} | {:error, Ecto.Changeset.t()}
  def create_food(attrs) do
    %Food{}
    |> Food.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food changes.

  This is typically used in forms to track changes before persisting them.

  ## Examples

      iex> food = %Diet.Diets.Food{name: "Orange", carbohydrates: Decimal.new("20"), fats: Decimal.new("0.2"), proteins: Decimal.new("1.5")}
      iex> changeset = Diet.Diets.change_food(food)
      iex> changeset.data.name
      "Orange"

      iex> food = %Diet.Diets.Food{name: "Orange", carbohydrates: Decimal.new("20"), fats: Decimal.new("0.2"), proteins: Decimal.new("1.5")}
      iex> changeset = Diet.Diets.change_food(food, %{name: "Grape"})
      iex> changeset.changes.name
      "Grape"

  """
  @spec change_food(Food.t(), map()) :: Ecto.Changeset.t()
  def change_food(%Food{} = food, attrs \\ %{}) do
    Food.changeset(food, attrs)
  end

  @doc """
  Updates a food with the given attributes.

  ## Examples

      iex> {:ok, food} = Diet.Diets.create_food(%{name: "Mango", carbohydrates: 15, fats: 0.4, proteins: 0.8})
      iex> {:ok, updated} = Diet.Diets.update_food(food, %{name: "Updated Mango"})
      iex> updated.name
      "Updated Mango"

      iex> {:ok, food} = Diet.Diets.create_food(%{name: "Pear", carbohydrates: 15, fats: 0.1, proteins: 0.4})
      iex> {:error, %Ecto.Changeset{}} = Diet.Diets.update_food(food, %{name: nil})

  """
  @spec update_food(Food.t(), map()) :: {:ok, Food.t()} | {:error, Ecto.Changeset.t()}
  def update_food(%Food{} = food, attrs) do
    food
    |> Food.changeset(attrs)
    |> Repo.update()
  end
end
