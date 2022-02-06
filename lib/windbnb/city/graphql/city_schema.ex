defmodule Windbnb.Modules.City.Graphql.CitySchema do
  use Absinthe.Schema.Notation

  import_types Windbnb.Modules.City.Graphql.CityType

  alias Windbnb.Modules.City.Graphql.CityResolver

  object :city_queries do
    @desc "Get cities"
    field :cities, list_of(:city) do
      resolve(&CityResolver.cities/3)
    end
  end

  object :city_mutations do
    @desc "Create city"
    field :create_city,  type: :city do
      arg :country_id, :id
      arg :name, non_null(:string)

      resolve(&CityResolver.create_city/3)
    end
  end
end
