defmodule Windbnb.Resolvers.StayResolver do
  alias Windbnb.Stay.Repository, as: Stay

  def stays(_root, _args, _info) do
    {:ok, Stay.list_stays}
  end

  def create_stay(_root, args, _info) do
    Stay.create_stay(args)
  end
end
