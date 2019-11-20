defmodule BeerSong do
  import Enum, only: [map: 2, join: 2]
  
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{ bottle(number) |> String.capitalize } of beer on the wall, #{ bottle(number) } of beer.
    #{ action(number) }, #{ bottle(number - 1) } of beer on the wall.
    """
  end  
  
  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    range
    |> map(&verse/1)
    |> join("\n")
  end
  def lyrics(), do: lyrics(99..0)
  
  defp bottle(number) when number < 0, do: bottle(99)
  defp bottle(0), do: "no more bottles"
  defp bottle(1), do: "1 bottle"
  defp bottle(number), do: "#{number} bottles" 

  defp action(0), do: "Go to the store and buy some more"
  defp action(1), do: "Take it down and pass it around"
  defp action(_), do: "Take one down and pass it around"

end

