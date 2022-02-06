defmodule Windbnb.Schema.StaySchema do
  use Absinthe.Schema.Notation
  alias IO

  import_types Windbnb.Types.StayType

  alias Windbnb.Resolvers.StayResolver

  object :stay_queries do
    @desc "Get Stays"
    field :stays, list_of(:stay) do
      resolve(&StayResolver.stays/3)
    end
  end

  object :stay_mutations do
    @desc "Create stay"
    field :create_stay, type: :stay do
      arg :city_id, :id
      arg :title, :string
      arg :rating, :float
      arg :beds, :integer
      arg :photo, :string
      arg :max_guests, :integer

      resolve(&StayResolver.create_stay/3)
    end
  end
end
