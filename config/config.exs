# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :conspectus,
  ecto_repos: [Conspectus.Repo]

# Configures the endpoint
config :conspectus, Conspectus.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "N7+8Uy0ZFQJ+mEhHgAhZMjR3j1/1T7bPqGlY8msU5957HxyJLONVQyXG4a5y4ODP",
  render_errors: [view: Conspectus.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Conspectus.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure authentication with Guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"],
  issuer: "Conspectus",
  ttl: { 90, :days },
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: "96Bfma0p6vGC9EL/r72mhv9pxu8NL4MMMj6eQLNESUzsS1+0401JXvJKpPEoAe0s",
  serializer: Conspectus.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
