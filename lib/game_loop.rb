require_relative 'game_sequence_generator'

class Game

  def initialize(player)
    @player = player
    @guess_count = 0
  end

  def greet_player
    puts "\nWelcome to MASTERMIND!"
  end

  def options
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def quit
    puts "\nGoodbye! Thanks for playing MASTERMIND!"
  end

  def get_input
    printf "\nenter command: "
    input = gets.downcase.chomp
    case input
    when 'i' then show_instructions
    when 'q' then quit
    when 'p' then initiate_game
    else
      puts   "Please enter the appropriate key:
              \n (i) = instructions
              \n (p) = play
              \n (q) = quit"
      get_input
    end
  end

  def show_instructions
    puts "\n"
    puts "Mastermind instructions go here." # read these in from text file?
    puts "\n"
    options
    get_input
  end

  def initiate_game
    @sequence = SequenceGenerator.generate
    start = Time.new
    @start_min = start.min
    @start_sec = start.sec
    puts "\n I have generated a beginner sequence of four elements made up of:"
    puts "\n\t (r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "\n\t Use (q)uit at any point to exit the game."
    run
  end


  def prompt_for_guess
    printf "\nEnter your guess: "
    puts ""
    @guess = gets.downcase
                 .chomp
                 .split(//)
  end

  def run
    p @sequence
    prompt_for_guess
      if @guess == ["q"]
        puts "\nGoodbye! Thanks for playing MASTERMIND!"
      elsif @guess.length != 4 || !@guess.all? {|i| i.match(/r|g|b|y/)}
        puts "\nIncorrect input"
        run
      elsif @guess == @sequence
        @guess_count += 1
        finish = Time.new
        finish_min = finish.min
        finish_sec = finish.sec
        puts "\n"
        puts "~".center(45, '~')
        puts " CORRECT! ".center(45, '~*~')
        puts "~".center(45, '~')
        puts "\nTotal Guesses" + "#{@guess_count}".rjust(30, '.')
        puts "\nElapsed time" + "#{finish_sec - @start_sec} seconds.".rjust(30, '.')
      else
        @guess_count += 1
        puts "\nWrong!"
        run
      end # if/else

    # case
    # when @guess == ["q"] then quit
    # when @guess.length != 1 || !@guess[0].match(/r|g|b|y/)
    #   puts "\n\tIncorrect input"
    #   prompt_for_guess
    # when @guess == sequence then puts "\n\tYou WIN"
    # else
    #   guess_count += 1
    #   puts "\n\tWrong!"
    #   prompt_for_guess
    # end # case @guess

  end # run

end # end Game class

game = Game.new("Jim")
game.greet_player
game.options
game.get_input
