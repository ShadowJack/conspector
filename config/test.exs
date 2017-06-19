use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :conspectus, Conspectus.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :conspectus, Conspectus.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "conspectus_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure comeonin to use less rounds of bcrypt algorithm
# to improve performance of tests
config :comeonin, :bcrypt_log_rounds, 4
