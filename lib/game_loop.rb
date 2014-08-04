require_relative 'game_sequence_generator'
require_relative 'guess_checker'
require_relative 'game_instructions'
require_relative 'message_printer'

class Game
  attr_reader :guess, :sequence, :printer

  def initialize
    @guess_count = 0
    @printer     = MessagePrinter.new
    @guess       = []
    @sequence    = []
  end

  def start
    printer.greet_player
    printer.command_options
    get_input
  end

  def get_input
    printf "\nEnter command: "
    input = gets.downcase.chomp
    case input
    when 'i', 'instructions' then show_instructions
    when 'q', 'quit' then printer.quit
    when 'p', 'play' then initiate_game
    # ADD HI SCORES OPTION
    else
      printer.command_options
      get_input
    end
  end

  def show_instructions
    @show_instructions = GameInstructions.load_instructions
    @show_instructions
    printer.command_options
    get_input
  end

  def elapsed_time
    @elapsed_time = (@time_finish - @time_start).to_i
  end

  def initiate_game
    @sequence   = SequenceGenerator.generate
    @time_start = Time.new
    printer.initiate_game_instructions
    run
  end

  def run
    puts "\n\t\t\t" + "( #{sequence} )"  # <= get rid of this when testing is complete!
    prompt_for_guess
    case
    when quit?
      printer.quit
    when invalid_input?
      input_error_message
    when correct_guess?
      @guess_count += 1
      @time_finish = Time.new
      total_guesses = "\n\tTotal Guesses " + " #{@guess_count}".rjust(40, '.')
      total_time = "\n\tElapsed time " + " #{elapsed_time} second(s).".rjust(40, '.')
      printer.win_message(total_guesses, total_time)
      get_user_name # STORE FOR HI SCORES...
      printer.command_options
      get_input
    else
      @guess_count += 1
      printer.incorrect_guess(@guess_count)
      guess_checker = GuessChecker.new(guess, sequence)
      guess_checker.feedback
      run
    end
  end

  private

  def prompt_for_guess
    printer.request_guess
    @guess = gets.downcase.chomp.split(//)
  end

  def quit?
    guess == ["q"]
  end

  def invalid_input?
    !guess.all? {|i| i.match(/r|g|b|y/)} || guess.length != 4
  end

  def input_error_message
    case
    when quit?
      printer.quit
    when !guess.all? {|i| i.match(/r|g|b|y/)}
      printer.input_error("characters other than r, g, b, or y")
      run
    when guess.length < 4
      printer.input_error("too few characters")
      run
    when guess.length > 4
      printer.input_error("too many characters")
      run
    else
      printer.input_error("an unknown error.")
      run
    end
  end

  def correct_guess?
    guess == sequence
  end

  def get_user_name
    printf "Please enter your first name: "
    player = gets.chomp.upcase
    thank_player = "\nThanks for playing #{player}!".upcase
    thank_player.each_char {|c| puts c.colorize(:white).blink; sleep 0.1}
    # give options = print hi-scores or quit
  end

end

game = Game.new
game.start
