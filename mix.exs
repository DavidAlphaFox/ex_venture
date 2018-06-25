defmodule ExVenture.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_venture,
      version: "0.22.0",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps(),
      aliases: aliases(),
      source_url: "https://github.com/oestrich/ex_venture",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger], mod: {ExVenture.Application, []}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:my_app, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:bamboo, "~> 0.8"},
      {:bamboo_smtp, "~> 1.4.0"},
      {:bcrypt_elixir, "~> 1.0"},
      {:cachex, "~> 3.0"},
      {:comeonin, "~> 4.0"},
      {:cowboy, "~> 1.0"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:distillery, "~> 1.4", runtime: false},
      {:earmark, "~> 1.2.3"},
      {:ecto, "~> 2.1"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:libcluster, "~> 2.1", only: [:dev, :prod]},
      {:logger_file_backend, "~> 0.0.10"},
      {:logster, "~> 0.4"},
      {:nostrum, git: "https://github.com/Kraigie/nostrum.git"},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:phoenix_html, "~> 2.10"},
      {:prometheus_ecto, "~> 1.0.1"},
      {:prometheus_ex, "~> 1.0"},
      {:prometheus_plugs, "~> 1.1"},
      {:prometheus_process_collector, "~> 1.2"},
      {:poison, "~> 3.1"},
      {:pot, git: "https://github.com/yuce/pot.git"},
      {:postgrex, ">= 0.0.0"},
      {:qrcode, git: "https://gitlab.com/oestrich/qrcode.git"},
      {:ranch, "~> 1.4"},
      {:sentry, "~> 6.2.1"},
      {:timex, "~> 3.1"},
      {:timex_ecto, "~> 3.1"},
      {:uuid, "~> 1.1"},
      {:yaml_elixir, "~> 1.3"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "ecto.migrate.reset": ["ecto.drop", "ecto.create", "ecto.migrate"]
    ]
  end
end
