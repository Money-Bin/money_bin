# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :money_bin,
  ecto_repos: [MoneyBin.Repo]

# Configures the endpoint
config :money_bin, MoneyBin.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4Vn9AvDs6AeQ3AlvecHOUHnzIXZDkRuuBYNZ5mm0bKvlecedsLDHisHCrr0luC51",
  render_errors: [view: MoneyBin.ErrorView, accepts: ~w(json)],
  pubsub: [name: MoneyBin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure UUID primary keys
config :phoenix, :generators,
  migration: true,
  binary_id: true

# Configure JSON-API
config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
