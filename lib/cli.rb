class CLI
  attr_reader :printer, :input

  def initialize
    @printer = MessagePrinter.new
    @input   = ""
  end

  def run
    printer.greet_player
    printer.command_options
    until input == "q"
      printf "\nEnter command: "
      @input = gets.downcase.strip
      process_app_commands
      break
    end
  end

  def process_app_commands
    case input
    when 'i', 'instructions'
      printer.show_instructions
    when 'q', 'quit'
      printer.quit
    when 'p', 'play'
      game = Game.new
      game.initiate_game
    when 's', 'scores'
      print_high_scores
      puts 'Loading high scores...'
      # ADD HI SCORES OPTION
    else
      printer.command_options
      run
    end
  end
end
