defmodule MastermindStrategyTest do
  use ExUnit.Case

  alias Mastermind.Strategy

  test "all combinations" do
    assert List.first(Strategy.combinations()) == [:red,:red,:red,:red]
    assert Enum.count(Strategy.combinations()) == 1296
  end

  test "guess matches" do
    assert Strategy.guess_matches([[:red,:red,:red,:red], [:red,:red,:red,:green]], [:red,:red,:red,:red], %{ red: 4, white: 0} ) == [[:red,:red,:red,:red]]
  end
end
