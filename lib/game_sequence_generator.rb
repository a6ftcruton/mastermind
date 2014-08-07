class SequenceGenerator
  def self.random_letter
    letters = ['r', 'g', 'b', 'y']
    letters.sample
  end

  def self.generate
    @sequence = []
    4.times { @sequence << random_letter }
    @sequence
  end
end
