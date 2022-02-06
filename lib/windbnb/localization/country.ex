defmodule Windbnb.Localization.Country do
  use Ecto.Schema
  import Ecto.Changeset

  alias Windbnb.Localization.City

  schema "countries" do
    field :name, :string
    has_many :cities, City

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name])
    |> cast_assoc(:cities)
    |> validate_required([:name])
  end
end