defmodule Windbnb.Localization do
  @moduledoc """
  The Localization context.
  """

  import Ecto.Query, warn: false
  alias Windbnb.Repo

  alias Windbnb.Localization.Country

  @doc """
  Returns the list of countries.

  ## Examples

      iex> list_countries()
      [%Country{}, ...]

  """
  def list_countries do
    Country
    |>Repo.all
    |> Repo.preload(:cities)
  end

  @doc """
  Gets a single country.

  Raises `Ecto.NoResultsError` if the Country does not exist.

  ## Examples

      iex> get_country!(123)
      %Country{}

      iex> get_country!(456)
      ** (Ecto.NoResultsError)

  """
  def get_country!(id) do 
    Country
    |> Repo.get!(id)
    |> Repo.preload(:cities)
  end

  @doc """
  Creates a country.

  ## Examples

      iex> create_country(%{field: value})
      {:ok, %Country{}}

      iex> create_country(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_country(attrs \\ %{}) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a country.

  ## Examples

      iex> update_country(country, %{field: new_value})
      {:ok, %Country{}}

      iex> update_country(country, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_country(%Country{} = country, attrs) do
    country
    |> Country.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a country.

  ## Examples

      iex> delete_country(country)
      {:ok, %Country{}}

      iex> delete_country(country)
      {:error, %Ecto.Changeset{}}

  """
  def delete_country(%Country{} = country) do
    Repo.delete(country)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking country changes.

  ## Examples

      iex> change_country(country)
      %Ecto.Changeset{data: %Country{}}

  """
  def change_country(%Country{} = country, attrs \\ %{}) do
    Country.changeset(country, attrs)
  end

  alias Windbnb.Localization.City

  @doc """
  Returns the list of cities.

  ## Examples

      iex> list_cities()
      [%City{}, ...]

  """
  def list_cities do
    City
    |>Repo.all
    |> Repo.preload(:country)
  end

  @doc """
  Gets a single city.

  Raises `Ecto.NoResultsError` if the City does not exist.

  ## Examples

      iex> get_city!(123)
      %City{}

      iex> get_city!(456)
      ** (Ecto.NoResultsError)

  """
  def get_city!(id) do
    City
    |> Repo.get!(id)
    |> Repo.preload(:country)
  end

  @doc """
  Creates a city.

  ## Examples

      iex> create_city(%{field: value})
      {:ok, %City{}}

      iex> create_city(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_city(attrs \\ %{}) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a city.

  ## Examples

      iex> update_city(city, %{field: new_value})
      {:ok, %City{}}

      iex> update_city(city, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_city(%City{} = city, attrs) do
    city
    |> City.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a city.

  ## Examples

      iex> delete_city(city)
      {:ok, %City{}}

      iex> delete_city(city)
      {:error, %Ecto.Changeset{}}

  """
  def delete_city(%City{} = city) do
    Repo.delete(city)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking city changes.

  ## Examples

      iex> change_city(city)
      %Ecto.Changeset{data: %City{}}

  """
  def change_city(%City{} = city, attrs \\ %{}) do
    City.changeset(city, attrs)
  end

  alias Windbnb.Localization.Stay

  @doc """
  Returns the list of stays.

  ## Examples

      iex> list_stays()
      [%Stay{}, ...]

  """
  def list_stays do
    Repo.all(Stay)
  end

  @doc """
  Gets a single stay.

  Raises `Ecto.NoResultsError` if the Stay does not exist.

  ## Examples

      iex> get_stay!(123)
      %Stay{}

      iex> get_stay!(456)
      ** (Ecto.NoResultsError)

  """
  def get_stay!(id) do 
    Stay
    |> Repo.get!(id)
    |> Repo.preload(:city)
  end

  @doc """
  Creates a stay.

  ## Examples

      iex> create_stay(%{field: value})
      {:ok, %Stay{}}

      iex> create_stay(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_stay(attrs \\ %{}) do
    %Stay{}
    |> Stay.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a stay.

  ## Examples

      iex> update_stay(stay, %{field: new_value})
      {:ok, %Stay{}}

      iex> update_stay(stay, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_stay(%Stay{} = stay, attrs) do
    stay
    |> Stay.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a stay.

  ## Examples

      iex> delete_stay(stay)
      {:ok, %Stay{}}

      iex> delete_stay(stay)
      {:error, %Ecto.Changeset{}}

  """
  def delete_stay(%Stay{} = stay) do
    Repo.delete(stay)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking stay changes.

  ## Examples

      iex> change_stay(stay)
      %Ecto.Changeset{data: %Stay{}}

  """
  def change_stay(%Stay{} = stay, attrs \\ %{}) do
    Stay.changeset(stay, attrs)
  end
end
