defmodule WindbnbWeb.Types.CityType do
  use Absinthe.Schema.Notation

  import_types Absinthe.Type.Custom

  object :city do
    field :id, non_null(:id)
    field :country_id, :id
    field :name, :string
    field :country, :country

    field :inserted_at, :date
    field :updated_at, :date
  end
end
