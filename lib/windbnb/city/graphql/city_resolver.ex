defmodule Windbnb.Modules.City.Graphql.CityResolver do
  alias Windbnb.Modules.City.CityRepository

  def cities(_root, _args, _info) do
    {:ok, CityRepository.list_cities}
  end

  def create_city(_root, args, _info) do
    CityRepository.create_city(args)
  end
end
