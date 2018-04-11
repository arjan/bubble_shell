@typing_indicator 0
@delay 0

dialog main do
  name = ask "What is your name?", timeout: 10
  if name do
    say "Hi, #{name}!"
  else
    say "Too late!"
  end
end
