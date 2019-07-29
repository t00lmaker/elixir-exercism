defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/\p{P}/, " ") 
    |> String.replace(~r/\p{S}/, "")
    |> String.split
    |> Enum.group_by(fn(word) ->  word end) 
    |> Enum.reduce(%{}, fn({k, v}, acc) -> 
      Map.put(acc, k, Enum.count(v)) 
    end)
  end
end
