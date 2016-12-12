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
      ]
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
      { :earmark, "~> 0.1", only: :docs },
      { :ex_doc, "~> 0.11", only: :docs },
      { :exjsx, "~> 3.2.0", app: false },
      { :httpoison, "~> 0.6" }
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
