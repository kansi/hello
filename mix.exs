defmodule Hello.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello,
      version: version(),
      elixir: "~> 1.11.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      releases: [
        hello: [
          include_executables_for: [:unix],
          steps: [:assemble, :tar],
          applications: [runtime_tools: :permanent],
          cookie: "simple_cookie_4526"
        ]
      ]
    ]
  end

  def version() do
    {hash, _} = System.cmd("git", ~w|rev-parse --short HEAD|)
    hash = String.trim(hash)

    {date, _} = System.cmd("git", ["log", "-1", "--pretty=format:%cd", "--date=format:%Y%m%d"])
    date = String.trim(date)

    "0.1.0+#{date}-#{hash}"
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Hello.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.9"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end
end
