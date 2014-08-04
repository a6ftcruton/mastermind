class MessagePrinter

  def layout(element, design=element)
    puts " "
    puts element.center(80, design)
    puts " "
  end

  def greet_player
    layout("=")
    puts "Welcome to MASTERMIND!".center(80, " ").colorize(:white)
    layout("=")
  end

  def initiate_game_instructions
    puts "-".center(80, "-").colorize(:white)
    puts "\n I have generated a beginner sequence of four elements made up of:"
    puts "\n\t (r)".colorize(:red) + "ed," + "(g)".colorize(:green) + "reen," + "(b)".colorize(:blue) + "lue, and " + "(y)".colorize(:yellow) + "ellow."
    puts "\n\t Use " + "(q)".colorize(:white) + "uit at any point to exit the game."
  end

  def request_guess
    puts "\nEnter your guess: "
  end

  def command_options
    puts "-".center(80, '-').colorize(:white)
    puts "You may enter any of the following options:
          \n " + "(i)".colorize(:white) + " = instructions
          \n " + "(p)".colorize(:white) + " = play
          \n " + "(q)".colorize(:white) + " = quit"
  end

  def quit
    puts "\nGoodbye! Thanks for playing MASTERMIND!"
  end

  def win_message(guesses, time)
    puts "\n"
    layout('~')
    puts" CORRECT! ".center(80, '~*~').colorize(:white).blink
    layout('~')
    puts guesses
    puts time
    layout('~')
    puts "~".center(80, '~*~')
    layout('~')
  end

  def incorrect_guess(guess_number)
    puts "\nIncorrect guess on attempt number " + "#{guess_number}".colorize(:white) + "!"
    puts "\n"
  end

  def input_error(msg)
    puts "* * * Input Error! * * *".center(80, " ").colorize(:red).blink
    puts "Your input contained #{msg}.".center(80," ").colorize(:red).blink
  end

end
