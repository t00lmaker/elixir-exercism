defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @dic %{  1 =>  "I", 
           4 =>  "IV",
           5 =>  "V",
           9 =>  "IX", 
          10 =>  "X",
          40 =>  "XL",
          50 =>  "L",
          90 =>  "XC",
         100 => "C",
         400 => "CD",
         500 => "D",
         900 => "CM",
        1000 => "M" }
  
  @base [ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    compose(number, 0, "")
  end

  defp compose(number = 0, _basei, roman), do: roman

  defp compose(number, basei, roman) do
    base = Enum.at(@base, basei)
    multi = div(number, base)
    resto = rem(number, base)
    compose(resto, basei+1, romanp(multi, base, roman))
  end

  defp romanp(multi = 0, _base, roman), do: roman

  defp romanp(multi, base, roman) do
    "#{roman}#{String.duplicate(@dic[base], multi)}"
  end
  
end
