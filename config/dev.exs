import Config

# Configure your database
config :live_sup, LiveSup.Repo,
  username: "postgres",
  password: "postgres",
  database: "sup_dev",
  hostname: System.get_env("PGHOST") || "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :live_sup, LiveSupWeb.Api.Guardian,
  issuer: "livesup",
  secret_key: "dev_secret"

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :live_sup, LiveSupWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  # reloadable_apps: [:palette, :live_sup, :live_sup_web],
  watchers: [
    # Start the esbuild watcher by calling Esbuild.install_and_run(:default, args)
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :live_sup, LiveSupWeb.Endpoint,
  live_reload: [
    iframe_attrs: [class: "hidden"],
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"lib/live_sup_web/(live|views)/.*(ex)$",
      ~r"lib/live_sup_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :live_sup, LiveSup.PromEx,
  disabled: false,
  manual_metrics_start_delay: :no_delay,
  drop_metrics_groups: [],
  grafana: [
    host: "http://docker.for.mac.localhost:3000",
    # Or authenticate via Basic Auth
    username: "admin",
    password: "admin",
    # This is an optional setting and will default to `true`
    upload_dashboards_on_start: true
  ],
  metrics_server: :disabled

if System.get_env("DEBUG_OTEL") == "true" do
  config :opentelemetry, :processors,
    otel_batch_processor: %{
      exporter: {:otel_exporter_stdout, []}
    }
else
  config :opentelemetry,
    traces_exporter: :none

  config :opentelemetry, :processors, [
    {:otel_simple_processor, %{}}
  ]
end
