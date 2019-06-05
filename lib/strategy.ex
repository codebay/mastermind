defmodule Mastermind.Strategy do
  alias Mastermind.Game
  alias Mastermind.Core

  @colours [:red, :blue, :green, :black, :orange, :yellow]

  def knuths_algorithm(game) do
    game
    |> Game.guess(random_guess())
    |> loop_while(combinations(), false, 1)
  end

  def random_guess do
    pins = List.to_tuple(@colours)
    [
      elem(pins, :rand.uniform(6) - 1),
      elem(pins, :rand.uniform(6) - 1),
      elem(pins, :rand.uniform(6) - 1),
      elem(pins, :rand.uniform(6) - 1)
    ]
  end

  def combinations() do
    for w <- @colours,
        x <- @colours,
        y <- @colours,
        z <- @colours, do: [w,x,y,z]
  end

  def guess_matches(combinations, guess, score) do
    combinations
    |> Enum.filter(&(Core.score(guess, &1) == score))
  end

  defp loop_while(game, _matches, true = _won, _iteration) do
    {:won, game}
  end

  defp loop_while(game, _matches, false = _won, iteration) when iteration > 12 do
    {:lost, game}
  end

  defp loop_while(game, matches, false = _won, iteration) do
    matches = guess_matches(matches,
      Game.current_guess?(game),
      Game.score?(game)
    )
    new_guess = Enum.random(matches)
    game = Game.guess(game, new_guess)
    loop_while(game, matches, Game.won?(game), iteration + 1)
  end
end
