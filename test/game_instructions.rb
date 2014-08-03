#require 'csv'

class GameInstructions
    attr_reader :instructions

  def self.load_instructions(directory)
    filename = '../data/instructions.txt'
    file = File.open(filename, "r+")
  end

end
