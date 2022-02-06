defmodule WindbnbWeb.Schema do
  use Absinthe.Schema
  
  import_types WindbnbWeb.Types.CountryType
  import_types WindbnbWeb.Types.CityType

  alias WindbnbWeb.Resolvers.CountryResolver
  alias WindbnbWeb.Resolvers.CityResolver

  query do
    @desc "Get countries"
    field :countries, list_of(:country) do
      resolve(&CountryResolver.countries/3)
    end
  
    @desc "Get country by id"
    field :country, type: :country do
      arg :id, non_null(:id)

      resolve(&CountryResolver.get_country/3)
    end

    @desc "Get cities"
    field :cities, list_of(:city) do
      resolve(&CityResolver.cities/3)
    end
  end

  mutation do
    @desc "Create country"
    field :create_country, type: :country do
      arg :name, non_null(:string)

      resolve(&CountryResolver.create_country/3)
    end

    @desc "Create city"
    field :create_city,  type: :city do
      arg :country_id, :id
      arg :name, non_null(:string)

      resolve(&CityResolver.create_city/3)
    end
  end
end
