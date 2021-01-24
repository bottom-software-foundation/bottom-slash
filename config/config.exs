import Config

config :bottom_slash,
  public_key: ""

if File.exists?("config/secret.exs"), do: import_config("secret.exs")
