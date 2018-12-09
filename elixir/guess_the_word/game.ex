defmodule Game do

    def play do   
        hints = "flour, water, yeast, bakery"
        IO.puts "Hints: #{hints}"

        guess = IO.gets "Guess the word: "
        guess = String.strip(guess)

        attempt(guess)
    end

    def attempt("bread") do
        IO.puts "won!"
    end
    def attempt(wrong_guess) do
        IO.puts "That is not correct!"

        guess = IO.gets "Try again: "
        guess = String.strip(guess)
        attempt(guess)
    end
end
