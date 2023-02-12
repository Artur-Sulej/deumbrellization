import Config

config :todo,
  nodes: [
    todo_web: [short_name: "deumbrellization-todo-web"]
  ]

# Configure Mix tasks and generators
config :todo,
  ecto_repos: [Todo.Repo]

# Configures Elixir's Logger
config :logger, :console, format: "$time $metadata[$level] $message\n"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
