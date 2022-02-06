defmodule Windbnb.Localization.Stay do
  use Ecto.Schema
  import Ecto.Changeset

  alias Windbnb.Localization.City

  schema "stays" do
    field :beds, :integer
    field :max_guests, :integer
    field :photo, :string
    field :rating, :float
    field :super_host, :boolean, default: false
    field :title, :string

    belongs_to :city, City

    timestamps()
  end

  @doc false
  def changeset(stay, attrs) do
    stay
    |> cast(attrs, [:title, :max_guests, :super_host, :rating, :beds, :photo, :city_id])
    |> validate_required([:title, :max_guests, :super_host, :rating, :beds, :photo])
  end

  def city_name(stay) do
    stay.city.name
  end
end
#
# ...
# def changeset(%User{} = user, attrs) do
#   user
#   |> cast(attrs, [:email, :encrypted_password, :first_name, :last_name])
#   |> build_full_name()
#   |> validate_required([:email, :encrypted_password, :full_name])
#   |> unique_constraint(:email)
#   |> update_change(:encrypted_password, &Bcrypt.hashpwsalt/1)
# end
# 
# defp build_full_name(changeset) do
#   first_name = get_field(changeset, :first_name)
#   last_name = get_field(changeset, :last_name)
#   put_change(changeset, :full_name, "#{first_name} #{last_name}")
# end
