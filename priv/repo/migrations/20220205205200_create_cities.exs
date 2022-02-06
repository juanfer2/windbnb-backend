defmodule Windbnb.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps()
    end

    create index(:cities, [:country_id])
  end
end
