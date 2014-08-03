class GuessChecker

  attr_reader :guess

  def initialize(guess_test, sequence)
    @guess_test = guess_test
    @sequence = sequence
  end

  def matches_found
    matched_items = (0..3).select {|index| @guess_test[index] == @sequence[index]}
    puts "\n\tYou correctly matched #{matched_items.length} letter(s)."
  end

  def correct_letters
    # when testing, skip over any matched item
    correct_letter_count = 0
    correct_letter_count += 1 if @sequence.include? @guess_test[0]
    correct_letter_count += 1 if @sequence.include? @guess_test[1]
    correct_letter_count += 1 if @sequence.include? @guess_test[2]
    correct_letter_count += 1 if @sequence.include? @guess_test[3]
    puts "\tYou have #{correct_letter_count} correct letters in incorrect positions."
  end

  def feedback
    puts "You guessed --> '#{@guess_test.join}''"
    matches_found
    puts "\n"
    correct_letters
  end

end
