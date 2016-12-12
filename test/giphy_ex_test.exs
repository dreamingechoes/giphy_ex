defmodule GiphyExTest do
  use ExUnit.Case

  test "Get a list of gifs with the term 'nintendo'" do
    results = GiphyEx.Gifs.get("nintendo")
    assert results["meta"]["status"] == 200
  end

  test "Get a gif by his ID" do
    results = GiphyEx.Gifs.get_by_id("IPqbZhStIeZdS")
    assert results["meta"]["status"] == 200
  end

  test "Get a list of gifs by his IDs" do
    results = GiphyEx.Gifs.get_by_ids(["IPqbZhStIeZdS", "xT8qBgIC1ZTKGf0kRG"])
    assert results["meta"]["status"] == 200
  end

  test "Get a random gif with the term 'nintendo'" do
    results = GiphyEx.Gifs.random("nintendo")
    assert results["meta"]["status"] == 200
  end

  test "Get a gif equivalent to the term 'happy'" do
    results = GiphyEx.Gifs.translate("happy")
    assert results["meta"]["status"] == 200
  end

  test "Get a list of trending gifs" do
    results = GiphyEx.Gifs.trending()
    assert results["meta"]["status"] == 200
  end

  test "Get a list of stickers with the term 'nintendo'" do
    results = GiphyEx.Stickers.get("nintendo")
    assert results["meta"]["status"] == 200
  end

  test "Get a random sticker with the term 'nintendo'" do
    results = GiphyEx.Stickers.random("nintendo")
    assert results["meta"]["status"] == 200
  end

  test "Get a sticker equivalent to the term 'happy'" do
    results = GiphyEx.Stickers.translate("happy")
    assert results["meta"]["status"] == 200
  end

  test "Get a list of trending stickers" do
    results = GiphyEx.Stickers.trending()
    assert results["meta"]["status"] == 200
  end
end
