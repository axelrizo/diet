defmodule Diet.Diets.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food" do
    field :name, :string
    field :carbohydrates, :integer
    field :fats, :integer
    field :proteins, :integer

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :carbohydrates, :fats, :proteins])
    |> validate_required([:name, :carbohydrates, :fats, :proteins])
  end
end
