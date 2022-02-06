defmodule WindbnbWeb.Resolvers.CountryResolver do
  alias Windbnb.Localization, as: Country
  alias IO

  def countries(_root, _args, _info) do
    { :ok, Country.list_countries }
  end

  def create_country(_root, args, _info) do
    Country.create_country(args)
  end

  def get_country(_root, args, _info) do
    try do
      id = String.to_integer(args.id)

      { :ok, Country.get_country!(id) }
    rescue
      error in ArgumentError  -> { :error, message: error.message }
      error in Ecto.NoResultsError -> { :error, message: error.message }
    end
  end
end
