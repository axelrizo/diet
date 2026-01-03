defmodule Diet.Repo.Migrations.AddFood do
  use Ecto.Migration

  def change do
    create table(:food) do
      add :name, :string, null: false
      add :carbohydrates, :decimal, precision: 10, scale: 2, null: false
      add :fats, :decimal, precision: 10, scale: 2, null: false
      add :proteins, :decimal, precision: 10, scale: 2, null: false

      timestamps()
    end
  end
end
