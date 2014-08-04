class MessagePrinter

  def layout(element, design=element)
    puts ""
    puts element.center(80, design)
    puts ""
  end

  def greet_player
    layout("=")
    puts "Welcome to MASTERMIND!".center(80, " ")
    layout("=")
  end

  def initiate_game_instructions
    puts layout("-")
    puts "\n I have generated a beginner sequence of four elements made up of:"
    puts "\n\t (r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "\n\t Use (q)uit at any point to exit the game."
  end

  def request_guess
    puts "\nEnter your guess: "
  end

  def command_options
    puts "You may enter any of the following options:
          \n (i) = instructions
          \n (p) = play
          \n (q) = quit"
  end

  def quit
    puts "\nGoodbye! Thanks for playing MASTERMIND!"
  end

  def win_message(guesses, time)
    puts "\n"
    layout('~')
    layout(" CORRECT! ", '~*~')
    layout('~')
    puts guesses
    puts time
    layout('~')
    puts "~".center(80, '~*~')
    layout('~')
  end

  def incorrect_guess(guess_number)
    puts "\nIncorrect guess on attempt number #{guess_number}!"
    puts "\n"
  end

  def input_error(msg)
    layout("* * * Input Error! * * *", ' ')
    layout("Your input contained #{msg}.", ' ')
  end

end
