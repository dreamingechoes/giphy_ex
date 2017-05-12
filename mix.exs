defmodule GiphyEx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :giphy_ex,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package(),
      description: description(),
      deps: deps(),
      docs: [
        main: "GiphyEx"
      ],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
      ],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      mod: { GiphyEx, [] },
      applications: [:httpoison, :exjsx]
    ]
  end

  defp deps do
    [
      { :earmark, "~> 0.1", only: :dev },
      { :ex_doc, "~> 0.11", only: :dev },
      { :exjsx, "~> 3.2.0", app: false, override: true },
      { :httpoison, "~> 0.6" },
      { :excoveralls, "~> 0.5.7" }
    ]
  end

  def package do
    [
      maintainers: [ "dreamingechoes" ],
      licenses: [ "MIT" ],
      links: %{ "Github" => "https://github.com/dreamingechoes/giphy_ex" }
    ]
  end

  def description do
    "Elixir wrapper to consume Giphy's API"
  end
end
