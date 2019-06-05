defmodule Mastermind.Core do
  @number_of_pins 4

  def score(code, guess) do
    %{
      red: position_and_colour_match(code, guess),
      white: colour_match_only(code, guess)
    }
  end

  defp position_and_colour_match(code, guess) do
    guess
    |> Enum.zip(code)
    |> Enum.count(&same?/1)
  end

  defp same?({x,y}), do: x == y

  defp colour_match_only(code, guess) do
     correct_colours(code, guess) - position_and_colour_match(code, guess)
  end

  defp correct_colours(code, guess) do
    @number_of_pins - Enum.count(code -- guess)
  end
end
