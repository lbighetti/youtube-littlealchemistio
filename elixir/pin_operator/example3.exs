foo = "hey"
bar = "hey"

case foo do
  ^bar ->
    IO.puts "Pinned! Matches!"
  _ ->
    :ok
end
