defmodule WindbnbWeb.Schema do
  use Absinthe.Schema

  import_types Windbnb.Modules.Country.Graphql.CountrySchema
  import_types Windbnb.Modules.City.Graphql.CitySchema
  import_types Windbnb.Schema.StaySchema

  query do
    import_fields :country_queries
    import_fields :city_queries
    import_fields :stay_queries
  end

  mutation do
    import_fields :country_mutations
    import_fields :city_mutations
    import_fields :stay_mutations
  end
end
