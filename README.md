# GiphyEx

[![Docs](https://img.shields.io/badge/docs-latest-brightgreen.svg?style=flat)](http://hexdocs.pm/giphy_ex/0.1.0/)
[![Hex.pm](https://img.shields.io/hexpm/v/giphy_ex.svg)](https://hex.pm/packages/giphy_ex)
[![Build Status](https://circleci.com/gh/dreamingechoes/giphy_ex.svg?style=shield)](https://circleci.com/gh/dreamingechoes/giphy_ex)
[![codecov](https://codecov.io/gh/dreamingechoes/giphy_ex/branch/master/graph/badge.svg)](https://codecov.io/gh/dreamingechoes/giphy_ex)

Just a simple wrapper for the Giphy's API in order to make easy to get the more awesome gifs of the internet. Absolutely silly package made for fun.

## Installation

Add ``giphy_ex`` to your dependencies in your ``mix.exs``:

```elixir
defp deps do
  [
    { :giphy_ex, "~> 0.1.0" }
  ]
end
```

and run `mix deps.get`.

## Dependencies

- [HTTPoison](https://github.com/edgurgel/httpoison)
- [JSEX](https://github.com/talentdeficit/exjsx)

## Usage

You have to set the API key on your project in order to be able to make requests. You can use the public beta key if you don't use it on production, wich is **"dc6zaTOxFJmzC”**. In other case, you have to get your own API key.

You can set the API key for the package via an environment variable like this:

```elixir
user@computer:/YOUR_APP_NAME$ GIPHY_API_KEY=dc6zaTOxFJmzC iex -S mix
```

or setting the API key on the configuration of your project like this:

```elixir
config :giphy_ex, :api_key, "YOUR_API_KEY_HERE"
```

And you're ready to use the package:

```elixir
user@computer:/YOUR_APP_NAME$ GIPHY_API_KEY=dc6zaTOxFJmzC iex -S mix
iex(1)> GiphyEx.start
iex(2)> results = GiphyEx.Gifs.random("nintendo")
```

You can see the documentation of the package on the [hexdocs website](http://hexdocs.pm/giphy_ex/0.1.0/).

## Reference

Here you have the [Giphy's API documentation](https://github.com/Giphy/GiphyAPI/) in order to know how it works in deeply.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dreamingechoes/giphy_ex. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The package is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
