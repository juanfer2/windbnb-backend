defmodule Windbnb.LocalizationTest do
  use Windbnb.DataCase

  alias Windbnb.Localization

  describe "countries" do
    alias Windbnb.Localization.Country

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def country_fixture(attrs \\ %{}) do
      {:ok, country} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Localization.create_country()

      country
    end

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Localization.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Localization.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      assert {:ok, %Country{} = country} = Localization.create_country(@valid_attrs)
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Localization.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      assert {:ok, %Country{} = country} = Localization.update_country(country, @update_attrs)
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Localization.update_country(country, @invalid_attrs)
      assert country == Localization.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Localization.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Localization.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Localization.change_country(country)
    end
  end

  describe "cities" do
    alias Windbnb.Localization.City

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Localization.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Localization.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Localization.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = Localization.create_city(@valid_attrs)
      assert city.name == "some name"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Localization.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, %City{} = city} = Localization.update_city(city, @update_attrs)
      assert city.name == "some updated name"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Localization.update_city(city, @invalid_attrs)
      assert city == Localization.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Localization.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Localization.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Localization.change_city(city)
    end
  end

  describe "stays" do
    alias Windbnb.Localization.Stay

    @valid_attrs %{beds: 42, max_guests: 42, photo: "some photo", rating: 120.5, super_host: true, title: "some title"}
    @update_attrs %{beds: 43, max_guests: 43, photo: "some updated photo", rating: 456.7, super_host: false, title: "some updated title"}
    @invalid_attrs %{beds: nil, max_guests: nil, photo: nil, rating: nil, super_host: nil, title: nil}

    def stay_fixture(attrs \\ %{}) do
      {:ok, stay} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Localization.create_stay()

      stay
    end

    test "list_stays/0 returns all stays" do
      stay = stay_fixture()
      assert Localization.list_stays() == [stay]
    end

    test "get_stay!/1 returns the stay with given id" do
      stay = stay_fixture()
      assert Localization.get_stay!(stay.id) == stay
    end

    test "create_stay/1 with valid data creates a stay" do
      assert {:ok, %Stay{} = stay} = Localization.create_stay(@valid_attrs)
      assert stay.beds == 42
      assert stay.max_guests == 42
      assert stay.photo == "some photo"
      assert stay.rating == 120.5
      assert stay.super_host == true
      assert stay.title == "some title"
    end

    test "create_stay/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Localization.create_stay(@invalid_attrs)
    end

    test "update_stay/2 with valid data updates the stay" do
      stay = stay_fixture()
      assert {:ok, %Stay{} = stay} = Localization.update_stay(stay, @update_attrs)
      assert stay.beds == 43
      assert stay.max_guests == 43
      assert stay.photo == "some updated photo"
      assert stay.rating == 456.7
      assert stay.super_host == false
      assert stay.title == "some updated title"
    end

    test "update_stay/2 with invalid data returns error changeset" do
      stay = stay_fixture()
      assert {:error, %Ecto.Changeset{}} = Localization.update_stay(stay, @invalid_attrs)
      assert stay == Localization.get_stay!(stay.id)
    end

    test "delete_stay/1 deletes the stay" do
      stay = stay_fixture()
      assert {:ok, %Stay{}} = Localization.delete_stay(stay)
      assert_raise Ecto.NoResultsError, fn -> Localization.get_stay!(stay.id) end
    end

    test "change_stay/1 returns a stay changeset" do
      stay = stay_fixture()
      assert %Ecto.Changeset{} = Localization.change_stay(stay)
    end
  end
end
