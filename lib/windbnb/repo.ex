defmodule Windbnb.Repo do
  use Ecto.Repo,
    otp_app: :windbnb,
    adapter: Ecto.Adapters.Postgres
end
