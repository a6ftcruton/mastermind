class GuessChecker
  attr_reader :guess, :sequence

  def initialize(guess, sequence)
    @guess    = guess
    @sequence = sequence
  end

  def matches_found
    ( 0..(sequence.length - 1) ).select {|index| guess[index] == sequence[index]}.length
  end

  def correct_color
    matches      = 0
    dup_sequence = sequence.dup
    guess.each do |color|
      if dup_sequence.include? color
        matches += 1
        color_index = dup_sequence.index(color)
        dup_sequence.delete_at(color_index)
      end
    end
    matches
  end

  def convert_guess
    guess.map do |i|
      case i
      when "r" then i = "\u25A9".colorize(:red)
      when "g" then i = "\u25A9".colorize(:green)
      when "b" then i = "\u25A9".colorize(:blue)
      when "y" then i = "\u25A9".colorize(:yellow)
      end
    end
  end

  def feedback
    puts "\n                   #{convert_guess.join(" ")}"
    puts "             \u279A"
    puts "You guessed "
    puts "             \u2798"
    puts "                   #{guess.join(" ")}"
    puts "\n\n\tYou correctly matched " + "#{matches_found}".colorize(:white) + " color(s)."
    puts "\n"
    puts "\tYou have " + "#{correct_color - matches_found}".colorize(:white) + " correct colors in incorrect positions."
  end

end
