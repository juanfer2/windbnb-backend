defmodule Windbnb.Modules.Country.Graphql.CountrySchema do
  use Absinthe.Schema.Notation

  import_types Windbnb.Modules.Country.Graphql.CountryType

  alias Windbnb.Modules.Country.Graphql.CountryResolver

  object :country_queries do
    @desc "Get countries"
    field :countries, list_of(:country) do
      resolve(&CountryResolver.countries/3)
    end
  
    @desc "Get country by id"
    field :country, type: :country do
      arg :id, non_null(:id)

      resolve(&CountryResolver.get_country/3)
    end
  end

  object :country_mutations do
    @desc "Create country"
    field :create_country, type: :country do
      arg :name, non_null(:string)

      resolve(&CountryResolver.create_country/3)
    end
  end
end
