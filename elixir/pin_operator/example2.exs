foo = "hey"
bar = "ho"

case foo do
  bar ->
    IO.puts "bar has rebinded."
  _ ->
    :ok
end
