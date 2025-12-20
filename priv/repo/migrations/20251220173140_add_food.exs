defmodule Diet.Repo.Migrations.AddFood do
  use Ecto.Migration

  def change do
    create table(:food) do
      add :name, :string, null: false
      add :carbohydrates, :integer, null: false
      add :fats, :integer, null: false
      add :proteins, :integer, null: false

      timestamps()
    end
  end
end
