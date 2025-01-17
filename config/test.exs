import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :blog_admin, BlogAdmin.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qyQm1n1O8tHmjpkQLwvtMArB8D6OxKoNusicm+TzbYL1kg/L53bbsic4XQW4kZ9o",
  server: false

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :blog, Blog.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "blog_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :blog_web, BlogWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/EpGcYkMt7FfpNPXGcBz9iXkrOOxyl390KOjgjhXu9BAs2215fuKREbNYtzib8WL",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :blog, Blog.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true
