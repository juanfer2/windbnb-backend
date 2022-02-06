defmodule Windbnb.Repo.Migrations.CreateStays do
  use Ecto.Migration

  @type_name :type

  def change do
    execute(
      """
      CREATE TYPE #{@type_name}
        AS ENUM ('Entire apartment','Entire house','Private room')
      """,
      "DROP TYPE #{@type_name}"
     )

    create table(:stays) do
      add :title, :string
      add :max_guests, :integer
      add :super_host, :boolean, default: false, null: false
      add :rating, :float
      add :beds, :integer
      add :photo, :string
      add :type, @type_name, null: true
      add :city_id, references(:cities, on_delete: :nothing)

      timestamps()
    end

    create index(:stays, [:city_id])
  end
end
