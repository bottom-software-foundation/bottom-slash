defmodule BottomSlash.MixProject do
  use Mix.Project

  def project do
    [
      app: :bottom_slash,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BottomSlash, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:typed_struct, "~> 0.2.1"},
      {:poison, "~> 3.1"},
      {:bottom, "~> 0.2"}
    ]
  end
end
