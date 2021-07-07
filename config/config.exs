# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hello, HelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p1pNC25SArNN8GvO8jwvP2t5HnU0fMnlfrFGcldu15nA2GsUgAHEar3jvQiw6mw3",
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hello.PubSub,
  live_view: [signing_salt: "vQcJ6Jp6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
