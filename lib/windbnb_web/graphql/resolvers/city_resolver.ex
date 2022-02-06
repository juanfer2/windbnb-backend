defmodule WindbnbWeb.Resolvers.CityResolver do
  alias Windbnb.Localization, as: City

  def cities(_root, _args, _info) do
    { :ok, City.list_cities }
  end

  def create_city(_root, args, _info) do
    City.create_city(args)
  end
end
