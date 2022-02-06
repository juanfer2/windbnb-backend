defmodule Windbnb.Modules.Country.Graphql.CountryResolver do
  alias Windbnb.Modules.Country.CountryRepository
  alias IO

  def countries(_root, _args, _info) do
    {:ok, CountryRepository.list_countries}
  end

  def create_country(_root, args, _info) do
    CountryRepository.create_country(args)
  end

  def get_country(_root, args, _info) do
    try do
      id = String.to_integer(args.id)

      {:ok, CountryRepository.get_country!(id)}
    rescue
      error in ArgumentError  -> { :error, message: error.message }
      error in Ecto.NoResultsError -> { :error, message: error.message }
    end
  end
end
