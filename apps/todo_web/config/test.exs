import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todo_web, TodoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "OWWFgdFY0dtgRT8Cg8GsFQIchHDIYPkwy7Yf1uniMzJKFFS9Y5Wfk0VjrNSNsu+u",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
