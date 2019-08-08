defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.replace("_", " ")
    |> String.downcase
    |> String.split 
    |> Enum.filter(&filter/1)
    |> Enum.group_by(&group/1) 
    |> Enum.reduce(%{}, &reduce/2) 
  end

  defp filter(word) do
    String.match?(word, ~r/^\p{L}/u) or String.match?(word, ~r/\p{N}/) 
  end

  defp group(word) do
    word
    |> String.replace(~r/\p{S}/, "")
    |> String.replace(~r/[,!&@$%^]/, "")
  end

  defp reduce({k, v}, acc) do    
    Map.put(acc, k, Enum.count(v)) 
  end

end
