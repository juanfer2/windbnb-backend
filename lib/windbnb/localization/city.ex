defmodule Windbnb.Localization.City do
  use Ecto.Schema
  import Ecto.Changeset

  alias Windbnb.Localization.Country


  schema "cities" do
    field :name, :string
    belongs_to :country, Country

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:country_id, :name])
    |> validate_required([:country_id, :name])
  end
end
