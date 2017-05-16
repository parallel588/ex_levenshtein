defmodule ExLevenshteinTest do
  use ExUnit.Case
  doctest ExLevenshtein

  test "calc distance" do
    assert ExLevenshtein.distance("ABC", "ABC") == 0
    assert ExLevenshtein.distance("", "") == 0
    assert ExLevenshtein.distance("ABC", "") == 3
    assert ExLevenshtein.distance("", "AB") == 2

    assert ExLevenshtein.distance("ABC", "ABCDEF") == 3
    assert ExLevenshtein.distance("ABC", "BCDE") == 3
    assert ExLevenshtein.distance("BCDE","ABCDEF") == 2
  end
end
