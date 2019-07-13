defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &RNATranscription.transpile/1)
  end

  def transpile(?G), do: ?C
  def transpile(?C), do: ?G
  def transpile(?T), do: ?A
  def transpile(?A), do: ?U
  def transpile(letter), do: "#{letter} not valid."
end
