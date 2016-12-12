defmodule GiphyEx.Gifs do
  @moduledoc """
  Provides functions to consume the Gif endpoint of Giphy's API.
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

  If we want to make a request to search some gifs with a limit of 12 elements, we have to execute something like this:

    ```elixir
    iex> results = GiphyEx.Gifs.get("nintendo", 12)
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with three main parts:

    - results["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the selected gifs.

    ```elixir
    iex> Enum.at(results["data"], 1)
    %{"bitly_gif_url" => "http://gph.is/Vwwrol",
      "bitly_url" => "http://gph.is/Vwwrol", "content_url" => "",
      "embed_url" => "http://giphy.com/embed/IPqbZhStIeZdS",
      "id" => "IPqbZhStIeZdS",
      "images" => %{"downsized" => %{"height" => "400", "size" => "455806",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy.gif",
          "width" => "400"},
        "downsized_large" => %{"height" => "400", "size" => "455806",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy.gif",
          "width" => "400"},
        "downsized_medium" => %{"height" => "400", "size" => "455806",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy.gif",
          "width" => "400"},
        "downsized_small" => %{"height" => "400",
          "mp4" => "http://media2.giphy.com/media/IPqbZhStIeZdS/giphy-downsized-small.mp4",
          "mp4_size" => "86277", "width" => "400"},
        "downsized_still" => %{"height" => "400",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy_s.gif",
          "width" => "400"},
        "fixed_height" => %{"height" => "200",
          "mp4" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200.mp4",
          "mp4_size" => "41141", "size" => "133827",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200.gif",
          "webp" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200.webp",
          "webp_size" => "113100", "width" => "200"},
        "fixed_height_downsampled" => %{"height" => "200", "size" => "69195",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200_d.gif",
          "webp" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200_d.webp",
          "webp_size" => "56846", "width" => "200"},
        "fixed_height_small" => %{"height" => "100",
          "mp4" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100.mp4",
          "mp4_size" => "16922", "size" => "35702",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100.gif",
          "webp" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100.webp",
          "webp_size" => "43932", "width" => "100"},
        "fixed_height_small_still" => %{"height" => "100",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100_s.gif",
          "width" => "100"},
        "fixed_height_still" => %{"height" => "200",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200_s.gif",
          "width" => "200"},
        "fixed_width" => %{"height" => "200",
          "mp4" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200w.mp4",
          "mp4_size" => "41141", "size" => "133827",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200w.gif",
          "webp" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200w.webp",
          "webp_size" => "113100", "width" => "200"},
        "fixed_width_downsampled" => %{"height" => "200", "size" => "69195",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200w_d.gif",
          "webp" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200w_d.webp",
          "webp_size" => "56846", "width" => "200"},
        "fixed_width_small" => %{"height" => "100",
          "mp4" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100w.mp4",
          "mp4_size" => "16922", "size" => "35702",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100w.gif",
          "webp" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100w.webp",
          "webp_size" => "43932", "width" => "100"},
        "fixed_width_small_still" => %{"height" => "100",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/100w_s.gif",
          "width" => "100"},
        "fixed_width_still" => %{"height" => "200",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/200w_s.gif",
          "width" => "200"},
        "looping" => %{"mp4" => "http://media.giphy.com/media/IPqbZhStIeZdS/giphy-loop.mp4"},
        "original" => %{"frames" => "12", "height" => "400",
          "mp4" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy.mp4",
          "mp4_size" => "102636", "size" => "455806",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy.gif",
          "webp" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy.webp",
          "webp_size" => "284620", "width" => "400"},
        "original_still" => %{"height" => "400",
          "url" => "http://media0.giphy.com/media/IPqbZhStIeZdS/giphy_s.gif",
          "width" => "400"},
        "preview" => %{"height" => "192",
          "mp4" => "http://media2.giphy.com/media/IPqbZhStIeZdS/giphy-preview.mp4",
          "mp4_size" => "43356", "width" => "192"}},
      "import_datetime" => "1970-01-01 00:00:00", "is_indexable" => 0,
      "rating" => "y", "slug" => "rainbow-nintendo-mario-IPqbZhStIeZdS",
      "source" => "http://standard-nerd.tumblr.com/post/9969927167/nyan-mario",
      "source_post_url" => "http://standard-nerd.tumblr.com/post/9969927167/nyan-mario",
      "source_tld" => "", "trending_datetime" => "2015-03-22 14:29:54",
      "type" => "gif",
      "url" => "http://giphy.com/gifs/rainbow-nintendo-mario-IPqbZhStIeZdS",
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
    GiphyEx.request("gifs/search", params)
  end

  @doc """
  Returns the information of a specific gif.

  It has one parameter:

    - id: the ID of the gif.

  ## Example:

  If we want to make a request to get the info of a gif, we have to execute something like this:

    ```elixir
    iex> result = GiphyEx.Gifs.get_by_id("IPqbZhStIeZdS")
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - result["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the selected gif (with the same format as the `get` method).
    - result["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
  """
  def get_by_id(id) do
    GiphyEx.request("gifs/" <> id)
  end

  @doc """
  Returns the information of some specific gifs.

  It has one parameter:

    - ids: a list of IDs of the gifs.

  ## Example:

  If we want to make a request to get the info of some gifs, we have to execute something like this:

    ```elixir
    iex> results = GiphyEx.Gifs.get_by_ids(["IPqbZhStIeZdS", "xT8qBgIC1ZTKGf0kRG"])
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - results["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the information of the gif (with the same format as the `get` method).
    - results["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
    - results["pagination"]: a [map](https://hexdocs.pm/elixir/Map.html) with the pagination info of the response (with the same format as the `get` method).
  """
  def get_by_ids(ids) do
    params = %{
      ids: Enum.join(ids, ",")
    }
    GiphyEx.request("gifs", params)
  end

  @doc """
  Returns the information of the trending gifs on Giphy.

  It has three parameters:

    - limit: number of elements to return. Maximun of 100, its default value is 10.
    - rating: filter results to the rating value ("y", "g", "pg", "pg-13" of "r"). Its default value is "g".
    - fmt: results format ("html" or "json"). Its default value is "json".

  ## Example:

  If we want to make a request to get the 25 firsts trending gifs, we have to execute something like this:

    ```elixir
    iex> results = GiphyEx.Gifs.trending(25)
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - results["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the gifs (with the same format as the `get` method).
    - results["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
    - results["pagination"]: a [map](https://hexdocs.pm/elixir/Map.html) with the pagination info of the response (with the same format as the `get` method).
  """
  def trending(limit \\ 10, rating \\ "g", fmt \\ "json") do
    params = %{
      limit: limit,
      rating: rating,
      fmt: fmt
    }
    GiphyEx.request("gifs/trending", params)
  end

  @doc """
  Returns the information of a gif on Giphy equivalent to a term or phrase.

  It has four parameters:

    - term: term or phrase to translate into a gif.
    - rating: filter results to the rating value ("y", "g", "pg", "pg-13" of "r"). Its default value is "g".
    - lang: specify country for regional content, on 2 letter ISO 639-1 format. Its default value is "en".
    - fmt: results format ("html" or "json"). Its default value is "json".

  ## Example:

  If we want to make a request to get a gif equivalent to the phrase "happy people", we have to execute something like this:

    ```elixir
    iex> result = GiphyEx.Gifs.translate("happy people")
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - result["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the information of the gif (with the same format as the `get` method).
    - result["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
  """
  def translate(term, rating \\ "g", lang \\ "en", fmt \\ "json") do
    params = %{
      s: term,
      rating: rating,
      lang: lang,
      fmt: fmt
    }
    GiphyEx.request("gifs/translate", params)
  end

  @doc """
  Returns the information of a random gif on Giphy with a specific tag.

  It has three parameters:

    - tag: search query term or phrase.
    - rating: filter results to the rating value ("y", "g", "pg", "pg-13" of "r"). Its default value is "g".
    - fmt: results format ("html" or "json"). Its default value is "json".

  ## Example:

  If we want to make a request to get a random gif by the tag of "nintendo", we have to execute something like this:

    ```elixir
    iex> result = GiphyEx.Gifs.random("nintendo")
    ```

  As a result, we have a [Map](https://hexdocs.pm/elixir/Map.html) with two main parts:

    - result["data"]: a [list](https://hexdocs.pm/elixir/List.html) with the information of the gif (with the same format as the `get` method).
    - result["meta"]: a [map](https://hexdocs.pm/elixir/Map.html) with the meta info of the response (with the same format as the `get` method).
  """
  def random(tag, rating \\ "g", fmt \\ "json") do
    params = %{
      tag: tag,
      rating: rating,
      fmt: fmt
    }
    GiphyEx.request("gifs/random", params)
  end

end
