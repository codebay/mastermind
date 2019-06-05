defmodule Mastermind.Game do

  alias Mastermind.Core

  defstruct(
    code: [],
    guesses: []
  )

  def new(code) do
    %__MODULE__{
      code: code
    }
  end

  def guess(game, guess) do
    %{
      game
      | guesses: [ {guess, Core.score(game.code, guess)} | game.guesses]
    }
  end

  def current_guess?(game) do
    {guess, _} = List.first(game.guesses)
    guess
  end

  def score?(game) do
    {_, score} = List.first(game.guesses)
    score
  end

  def won?(game) do
    score?(game) == %{red: 4, white: 0}
  end

  def moves?(game) do
    Enum.count(game.guesses)
  end
end
