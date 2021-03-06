require 'colorize'

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

  def command_options
    puts "-".center(80, '-').colorize(:white)
    puts "You may enter any of the following options:
          \n " + "(i)".colorize(:white) + " = instructions
          \n " + "(p)".colorize(:white) + " = play
          \n " + "(q)".colorize(:white) + " = quit"
  end

  def request_guess
    puts "\nEnter your guess: "
  end

  def show_sequence_for_dev_purposes(sequence)
    puts "\n\t\t\t" + "( #{sequence} )"
  end

  def thank_player(player)
    thank_player = "\nThanks for playing #{player}!".upcase
    thank_player.each_char {|c| print c.colorize(:white); sleep 0.1}
    puts "\n\n"
  end

  def prompt_for_user_name
    printf "Please enter your first name: "
  end

  def quit
    puts "\nGoodbye! Thanks for playing MASTERMIND!"
  end

  def options_after_win
    print "What would you like to do now?"
    puts "\n\t (p)lay again, (q)uit, or view hi (s)cores?"
  end

  def win_message(guesses, time)
    puts "\n"
    layout('~')
    puts" CORRECT! ".center(80, '~*~').colorize(:white)
    layout('~')
    puts "\n\tTotal Guesses " + " #{guesses}".rjust(40, '.')
    puts "\n\tElapsed time " + " #{time} second(s).".rjust(40, '.')
    layout('~')
    puts "~".center(80, '~*~')
  end

  def incorrect_guess(guess_number)
    puts "\nIncorrect guess on attempt number " + "#{guess_number}".colorize(:white) + "!"
    puts "\n"
  end

  def input_error(msg)
    puts "* * * Input Error! * * *".center(80, " ").colorize(:red).blink
    puts "Your input contained #{msg}.".center(80," ").colorize(:red).blink
  end

  def hi_scores_banner
    layout("* * * ")
    layout('    H I   S C O R E S    ',"/\\" )
    layout("* * * ")
  end

  def show_instructions
    puts "-".center(80, '-').colorize(:white) +
    "\n\n\nOBJECT".colorize(:white) +
    "\n\nThe computer will select a secrete combinaton of colored pegs." +
    "\nYour job is to guess that combination in as few tries as possible." +

    "\n\n\nHOW TO PLAY".colorize(:white) +
    "\n\nEach of the peg positions can be any of 4 colors:" +
    "\n\n\tred, green, blue, or yellow." +
    "\n\nAny color can be used more than once or not at all." +
    "\n\te.g." +

    "\n\n\t\t\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:red) +
    "\t[r r r r]" +
    "\n\n" +
    "\n\t\t\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:green) + "  " + "\u25A9".colorize(:blue) + "  " + "\u25A9".colorize(:yellow) +
    "\t[r g b y]" +
    "\n\n\nEach time you submit a guess, you will receive feedback about the following: " +
    "\n\n\t-how many colors you have matched in the correct location" +
    "\n\n\t-how many correct colors you have chosen but put in the wrong location" +
    "\n\nUse this information to make a better guess each time." +

    "\n\n\nWINNING".colorize(:white) +
    "\n\nAll players who complete the game with a correct guess will be given their" +
    "elapsed time and the number of guesses they required to win." +
    "Players with impressive scores will be added to the Hi - Scores Archive!" +

    "\n\n\nEXITING THE GAME".colorize(:white) +
    "\n\nAt any time if you wish to exit the game, simply type (q)" +
    " and press enter. Winning the game also exits you automatically." +
    "\n\n\n"
  end
end
