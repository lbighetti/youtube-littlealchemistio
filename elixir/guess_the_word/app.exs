# "bread"

hints = "flour, water, yeast, bakery"
IO.puts "Hints: #{hints}"

guess = IO.gets "Guess the word: "
guess = String.strip(guess)

case guess do
  "bread" ->
    IO.puts "won!"
  _ ->
    IO.puts "lost!"
end
