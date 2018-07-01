# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_app,
  ecto_repos: [MyApp.Repo]

# Configures the endpoint
config :my_app, MyAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NMHPfa1m40YyCrOgVYeKuOkVE9dBaRehJChti6/1BOBuzxU/IDNv+AuNpzsWF+lS",
  render_errors: [view: MyAppWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MyApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :my_app, MyApp.Guardian,
  issuer: "MyApp",
  secret_key: "ewQFUHI4GIvPdhL7x6yf+iZLTndDSisrt2stLxFaLsE/Jhq4tSnNmCQ3wow0piLV"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
