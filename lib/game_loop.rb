require_relative 'game_sequence_generator'
require_relative 'guess_checker'
require_relative 'game_instructions'

class Game

  def initialize(player)
    @player = player
    @guess_count = 0
  end

  def layout(starter, design=starter)
    puts ""
    puts starter.center(80, design)
    puts ""
  end

  def greet_player
    layout("=")
    puts "Welcome to MASTERMIND!".center(80, " ")
    layout("=")
  end

  def options
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def quit
    puts "\nGoodbye! Thanks for playing MASTERMIND!"
  end

  def get_input
    printf "\nEnter command: "
    input = gets.downcase.chomp
    case input
    when 'i' then show_instructions # File.open('/data/instructions.txt')
    when 'q' then quit
    when 'p' then initiate_game
    else
      puts   "Please enter the appropriate key:
              \n (i) = instructions
              \n (p) = play
              \n (q) = quit"
      get_input
    end # case
  end # get_input

  def show_instructions
    @show_instructions = GameInstructions.load_instructions
    @show_instructions
    options
    get_input
  end

  def initiate_game_instructions
    puts "\n I have generated a beginner sequence of four elements made up of:"
    puts "\n\t (r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "\n\t Use (q)uit at any point to exit the game."
  end

  def prompt_for_guess
    printf "\nEnter your guess: "
    puts ""
    @guess = gets.downcase.chomp.split(//)
  end

  def elapsed_time
    @elapsed_time = (@time_finish - @time_start).to_i
  end

  def initiate_game
    @sequence = SequenceGenerator.generate
    @time_start = Time.new
    initiate_game_instructions
    run
  end

  def run
    puts "\n\t\t\t" + "( #{@sequence} )"  # <= get rid of this when testing is complete!
    prompt_for_guess
      if @guess == ["q"]
        puts "\nGoodbye! Thanks for playing MASTERMIND!"
      elsif @guess.length != 4 || !@guess.all? {|i| i.match(/r|g|b|y/)}
        puts "\nIncorrect input: please enter only the following characters: r g b y. Do not use spaces or commas."
        run
      elsif @guess == @sequence
        @guess_count += 1
        @time_finish = Time.new
        puts "\n"
        layout('~')
        layout(" CORRECT! ", '~*~')
        layout('~')
        puts "\n\tTotal Guesses " + " #{@guess_count}".rjust(40, '.')
        puts "\n\tElapsed time " + " #{elapsed_time} second(s).".rjust(40, '.')
        layout('~')
        puts "~".center(80, '~*~')
        layout('~')
      else
        @guess_count += 1
        #pass guess to guess_checker
        puts "\nIncorrect guess on attempt number #{@guess_count}!"
        puts "\n"
        guess_checker = GuessChecker.new(@guess, @sequence)
        guess_checker.feedback
        run
      end # if/else
  end # run
end # end Game class

game = Game.new("Jim")
game.greet_player
game.options
game.get_input
