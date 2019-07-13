defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &transpile/1)
  end

  defp transpile(?G), do: ?C
  defp transpile(?C), do: ?G
  defp transpile(?T), do: ?A
  defp transpile(?A), do: ?U
end
