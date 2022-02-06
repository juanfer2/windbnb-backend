defmodule Windbnb.Modules.Country.Graphql.CountryType do
  use Absinthe.Schema.Notation

  object :country do
    field :id, non_null(:id)
    field :name, :string
    field :cities, list_of(:city)
  end
end
