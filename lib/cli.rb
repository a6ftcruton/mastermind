class CLI
  attr_reader :printer, :input

  def initialize
    @printer = MessagePrinter.new
    @input   = ""
  end

  def run
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
      run
    when 'q', 'quit'
      printer.quit
    when 'p', 'play'
      game = Game.new
      game.initiate_game
    when 's', 'scores'
      HiScores.print_high_scores
      run
      puts 'Loading high scores...'
    else
      printer.command_options
      run
    end
  end
end
