defmodule Windbnb.Types.StayType do
  use Absinthe.Schema.Notation

  object :stay do
    field :id, non_null(:id)
    field :beds, :integer
    field :max_guests, :integer
    field :photo, :string
    field :rating, :float
    field :super_host, :boolean
    field :title, :string
  end
end
