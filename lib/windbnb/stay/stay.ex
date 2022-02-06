defmodule Windbnb.Modules.Stay do
  use Ecto.Schema
  import Ecto.Changeset

  alias Windbnb.Localization.City

  schema "stays" do
    field :beds, :integer
    field :max_guests, :integer
    field :photo, :string
    field :rating, :float
    field :super_host, :boolean, default: false
    field :title, :string

    belongs_to :city, City

    timestamps()
  end

  @doc false
  def changeset(stay, attrs) do
    stay
    |> cast(attrs, [:title, :max_guests, :super_host, :rating, :beds, :photo, :city_id])
    |> validate_required([:title, :max_guests, :super_host, :rating, :beds, :photo])
  end

  def city_name(stay) do
    stay.city.name
  end
end
