# Mastermind Kata

This game where one player, the "code maker", has to choose a secret combination of colored pegs and then make it guess to someone else, the "code breaker". The code maker is answering to each guess attempt of the codebreaker by indicating only the number of well placed colors (red pegs) and the number of correct but misplaced colors (white pegs).

## Problem Description

The idea of this Kata is to code an algorithm capable of playing this game, answering the number of well placed and misplaced colors.

## Knuth's Algorithm

Code breaking algorithm is described well here https://github.com/nattydredd/Mastermind-Five-Guess-Algorithm

## Breaking the code

Kunth showed that an initial guess two consecutive colours with the pattern [1122] is optimal to
break the code in five or less guesses.

If you run the code in the elixir repl (iex)

```
iex> Mastermind.Game.new([:red, :red, :blue, :blue]) |> Mastermind.Strategy.break_code
{:won,
 %Mastermind.Game{
   code: [:red, :red, :blue, :blue],
   guesses: [
     {[:red, :red, :blue, :blue], %{red: 4, white: 0}},
     {[:red, :orange, :blue, :red], %{red: 2, white: 1}},
     {[:red, :blue, :red, :black], %{red: 1, white: 2}},
     {[:red, :red, :green, :green], %{red: 2, white: 0}}
   ]
 }}
```

The code was solved in 4 guesses.
