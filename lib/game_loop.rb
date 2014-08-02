require_relative 'game_sequence_generator'

class Game

  def initialize(player)
    @player = player
  end

  def greet_player
    puts "\nWelcome to MASTERMIND!"
  end

  def options
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def get_input
    printf "\nenter command: "
    input = gets.downcase.chomp
    case input
    when 'i' then show_instructions
    when 'q' then puts "\nGoodbye! Thanks for playing MASTERMIND!"
    when 'p' then run
    else
      puts   "Please enter the appropriate key:
              \n (i) = instructions
              \n (p) = play
              \n (q) = quit"
      get_input
    end
  end

  def show_instructions
    puts "Mastermind instructions go here."
  end

  def run
    new_sequence = SequenceGenerator.generate
    puts "\nI have generated a beginner sequence of four elements made up of:
    \n (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any point to exit the game."
    puts "Enter your guess:"
    guess = gets.downcase.chomp
  end

end # end Game class

game = Game.new("Jim")
game.greet_player
game.options
game.get_input
