foo = "hey"

case foo do
  "hey" ->
    IO.puts "Normal case"
  _ ->
    :ok
end
