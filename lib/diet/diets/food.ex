defmodule Diet.Diets.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food" do
    field :name, :string

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
