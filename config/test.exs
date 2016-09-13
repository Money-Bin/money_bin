use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :money_bin, MoneyBin.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
if System.get_env("CI") == "true" do
  config :money_bin, MoneyBin.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: System.get_env("POSTGRES_ENV_USER") || "postgres",
    password: System.get_env("POSTGRES_ENV_PASS") || "postgres",
    hostname: System.get_env("POSTGRES_PORT_5432_TCP_ADDR") || "localhost",
    database: System.get_env("POSTGRES_ENV_DB") || "money_bin_test",
    pool: Ecto.Adapters.SQL.Sandbox
else
  config :money_bin, MoneyBin.Repo,
    adapter: Ecto.Adapters.Postgres,
    database: "money_bin_test",
    pool: Ecto.Adapters.SQL.Sandbox
end
