defmodule Diet.Diets.Food do
  @moduledoc """
  The Food schema.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @type t :: %__MODULE__{
          id: integer() | nil,
          name: String.t(),
          carbohydrates: Decimal.t(),
          fats: Decimal.t(),
          proteins: Decimal.t(),
          inserted_at: NaiveDateTime.t() | nil,
          updated_at: NaiveDateTime.t() | nil
        }

  schema "food" do
    field :name, :string
    field :carbohydrates, :decimal
    field :fats, :decimal
    field :proteins, :decimal

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :carbohydrates, :fats, :proteins])
    |> validate_required([:name, :carbohydrates, :fats, :proteins])
    |> validate_number(:carbohydrates, greater_than_or_equal_to: 0)
    |> validate_number(:fats, greater_than_or_equal_to: 0)
    |> validate_number(:proteins, greater_than_or_equal_to: 0)
  end
end
