defmodule GiphyEx.Stickers do
  @moduledoc """
  Provides functions to consume the Sticker endpoint of Giphy's API.
  """

  @doc """
  Executes a GET request to the `search` method of the API.

  It has six parameters:

    - query: the search query term.
    - limit: number of elements to return. Maximun of 100, its default value is 10.
    - offset: results offset, its default value is 0.
    - rating: filter results to the rating value ("y", "g", "pg", "pg-13" of "r"). Its default value is "g".
    - lang: specify country for regional content, on 2 letter ISO 639-1 format. Its default value is "en".
    - fmt: results format ("html" or "json"). Its default value is "json".

  ## Example:

  If we want to make a request to search some stickers with a limit of 12 elements, we have to execute something like this:

    ```elixir
    iex> results = GiphyEx.Stickers.get("nintendo", 12)
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with three main parts:

    - results["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the selected stickers.

    ```elixir
    iex> Enum.at(results["data"], 1)
      %{"bitly_gif_url" => "http://gph.is/1YuYswr",
        "bitly_url" => "http://gph.is/1YuYswr", "content_url" => "",
        "embed_url" => "http://giphy.com/embed/CIbEvAsWF5aMg",
        "id" => "CIbEvAsWF5aMg",
        "images" => %{"downsized" => %{"height" => "609", "size" => "405115",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy-tumblr.gif",
            "width" => "500"},
          "downsized_large" => %{"height" => "609", "size" => "405115",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy.gif",
            "width" => "500"},
          "downsized_medium" => %{"height" => "609", "size" => "405115",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy.gif",
            "width" => "500"},
          "downsized_small" => %{"mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy-downsized-small.mp4",
            "mp4_size" => "123173"},
          "downsized_still" => %{"height" => "609", "size" => "28538",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy-tumblr_s.gif",
            "width" => "500"},
          "fixed_height" => %{"height" => "200",
            "mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200.mp4",
            "mp4_size" => "30101", "size" => "100802",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200.gif",
            "webp" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200.webp",
            "webp_size" => "90876", "width" => "164"},
          "fixed_height_downsampled" => %{"height" => "200", "size" => "41478",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200_d.gif",
            "webp" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200_d.webp",
            "webp_size" => "36378", "width" => "164"},
          "fixed_height_small" => %{"height" => "100",
            "mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100.mp4",
            "mp4_size" => "13281", "size" => "44144",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100.gif",
            "webp" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100.webp",
            "webp_size" => "42074", "width" => "82"},
          "fixed_height_small_still" => %{"height" => "100", "size" => "4357",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100_s.gif",
            "width" => "82"},
          "fixed_height_still" => %{"height" => "200", "size" => "8319",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200_s.gif",
            "width" => "164"},
          "fixed_width" => %{"height" => "244",
            "mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200w.mp4",
            "mp4_size" => "38150", "size" => "126982",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200w.gif",
            "webp" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200w.webp",
            "webp_size" => "112798", "width" => "200"},
          "fixed_width_downsampled" => %{"height" => "244", "size" => "52353",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200w_d.gif",
            "webp" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200w_d.webp",
            "webp_size" => "45486", "width" => "200"},
          "fixed_width_small" => %{"height" => "122",
            "mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100w.mp4",
            "mp4_size" => "16033", "size" => "56684",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100w.gif",
            "webp" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100w.webp",
            "webp_size" => "52636", "width" => "100"},
          "fixed_width_small_still" => %{"height" => "122", "size" => "5240",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/100w_s.gif",
            "width" => "100"},
          "fixed_width_still" => %{"height" => "244", "size" => "10025",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/200w_s.gif",
            "width" => "200"},
          "looping" => %{"mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy-loop.mp4",
            "mp4_size" => "1421041"},
          "original" => %{"frames" => "15",
            "hash" => "6723f53890d821aefdd3f3c2a4ed4c09", "height" => "609",
            "mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy.mp4",
            "mp4_size" => "125399", "size" => "405115",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy.gif",
            "webp" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy.webp",
            "webp_size" => "273704", "width" => "500"},
          "original_still" => %{"height" => "609", "size" => "28538",
            "url" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy_s.gif",
            "width" => "500"},
          "preview" => %{"height" => "246",
            "mp4" => "http://media1.giphy.com/media/CIbEvAsWF5aMg/giphy-preview.mp4",
            "mp4_size" => "45432", "width" => "202"}},
        "import_datetime" => "2016-06-16 17:16:57", "is_indexable" => 0,
        "rating" => "g", "slug" => "nintendo-CIbEvAsWF5aMg",
        "source" => "http://rebloggy.com/post/gif-gaming-nintendo-kirby-transparent/64208815372",
        "source_post_url" => "http://rebloggy.com/post/gif-gaming-nintendo-kirby-transparent/64208815372",
        "source_tld" => "rebloggy.com", "trending_datetime" => "1970-01-01 00:00:00",
        "type" => "gif", "url" => "http://giphy.com/gifs/nintendo-CIbEvAsWF5aMg",
        "username" => ""}
    ```

    - results["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response.
    ```elixir
    iex> results["meta"]
    %{"msg" => "OK", "response_id" => "584e84f27220a66ec59a1fb5", "status" => 200}
    ```

    - results["pagination"]: a [map](https://hexdocs.pm/elixir/Map.html) with the pagination info of the response.
    ```elixir
    iex> results["pagination"]
    %{"count" => 12, "offset" => 0, "total_count" => 6282}
    ```
  """
  def get(query, limit \\ 10, offset \\ 0, rating \\ "g", lang \\ "en", fmt \\ "json") do
    params = %{
      q: query,
      limit: limit,
      offset: offset,
      rating: rating,
      lang: lang,
      fmt: fmt
    }
    GiphyEx.request("stickers/search", params)
  end

  @doc """
  Returns the information of the trending stickers on Giphy.

  It has three parameters:

    - limit: number of elements to return. Maximun of 100, its default value is 10.
    - offset: results offset, its default value is 0.
    - rating: filter results to the rating value ("y", "g", "pg", "pg-13" of "r"). Its default value is "g".
    - fmt: results format ("html" or "json"). Its default value is "json".

  ## Example:

  If we want to make a request to get the 25 firsts trending stickers, we have to execute something like this:

    ```elixir
    iex> results = GiphyEx.Stickers.trending(25)
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - results["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the stickers (with the same format as the `get` method).
    - results["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
    - results["pagination"]: a [map](https://hexdocs.pm/elixir/Map.html) with the pagination info of the response (with the same format as the `get` method).
  """
  def trending(limit \\ 10, offset \\ 0, rating \\ "g", fmt \\ "json") do
    params = %{
      limit: limit,
      offset: offset,
      rating: rating,
      fmt: fmt
    }
    GiphyEx.request("stickers/trending", params)
  end

  @doc """
  Returns the information of a sticker on Giphy equivalent to a term or phrase.

  It has four parameters:

    - term: term or phrase to translate into a gif.
    - rating: filter results to the rating value ("y", "g", "pg", "pg-13" of "r"). Its default value is "g".
    - lang: specify country for regional content, on 2 letter ISO 639-1 format. Its default value is "en".
    - fmt: results format ("html" or "json"). Its default value is "json".

  ## Example:

  If we want to make a request to get a sticker equivalent to the phrase "happy people", we have to execute something like this:

    ```elixir
    iex> result = GiphyEx.Stickers.translate("happy people")
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - result["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the information of the sticker (with the same format as the `get` method).
    - result["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
  """
  def translate(term, rating \\ "g", lang \\ "en", fmt \\ "json") do
    params = %{
      s: term,
      rating: rating,
      lang: lang,
      fmt: fmt
    }
    GiphyEx.request("stickers/translate", params)
  end

  @doc """
  Returns the information of a random sticker on Giphy with a specific tag.

  It has three parameters:

    - tag: search query term or phrase.
    - rating: filter results to the rating value ("y", "g", "pg", "pg-13" of "r"). Its default value is "g".
    - fmt: results format ("html" or "json"). Its default value is "json".

  ## Example:

  If we want to make a request to get a random sticker by the tag of "nintendo", we have to execute something like this:

    ```elixir
    iex> result = GiphyEx.Stickers.random("nintendo")
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - result["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the information of the sticker (with the same format as the `get` method).
    - result["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
  """
  def random(tag, rating \\ "g", fmt \\ "json") do
    params = %{
      tag: tag,
      rating: rating,
      fmt: fmt
    }
    GiphyEx.request("stickers/random", params)
  end

end
