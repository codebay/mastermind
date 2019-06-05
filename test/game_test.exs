defmodule MastermindGameTest do
  use ExUnit.Case

  alias Mastermind.Game

  test "new game" do
    assert Game.new([:red, :red, :red, :red]) == %Game{code: [:red, :red, :red, :red], guesses: []}
  end
end
