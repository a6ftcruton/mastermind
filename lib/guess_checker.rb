class GuessChecker

  attr_reader :guess, :feedback

  def initialize(guess)
    @guess = guess.downcase.chomp.split(//)
  end

  def feedback
    
  end
end
