defmodule ExLevenshtein do
  @moduledoc """
  Documentation for ExLevenshtein.
  """

  def cost(c1, c1), do: 0
  def cost(_, _), do: 1

  def distance(a, b) when is_binary(a) or is_binary(b) do
    distance(to_charlist(a), to_charlist(b))
  end

  def distance(a, ''),  do: :string.len(a)
  def distance('', b), do: :string.len(b)
  def distance(a, a), do: 0

  def distance([h1|text1], [h2|text2]) do
    :lists.min([
      distance(text1, [h2|text2]) + 1,
      distance([h1|text1], text2) + 1,
      distance(text1, text2) + cost(h1, h2)
    ])
   end
end
