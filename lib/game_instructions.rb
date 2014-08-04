class GameInstructions
  attr_reader :instructions

# def initialize( instructions = File.open('../data/instructions.txt', 'r') )
#     @instructions = instructions
#   end

  def self.load_instructions
    puts @instructions.center(100, '*')
  end

  @instructions =
  "-".center(80, '-').colorize(:white) +
  "\n\n\nOBJECT".colorize(:white) +
  "\n\nThe computer will select a secrete combinaton of colored pegs." +
  "\nYour job is to guess that combination in as few tries as possible." +

  "\n\n\nHOW TO PLAY".colorize(:white) +
  "\n\nEach of the peg positions can be any of 4 colors:" +
    "\n\n\tred, green, blue, or yellow." +
    "\n\nAny color can be used more than once or not at all." +
    "\n\te.g." +

    "\n\t\t\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:red) +
    "[r r r r]" +
    "\n\t\t\u25A9".colorize(:red) + "  " + "\u25A9".colorize(:green) + "  " + "\u25A9".colorize(:blue) + "  " + "\u25A9".colorize(:yellow) +
    "[r g b y]" +
    "\n\nEach time you submit a guess, you will receive feedback about the following: " +
    "\n\n\t-how many colors you have matched in the correct location" +
    "\n\n\t-how many correct colors you have chosen but put in the wrong location" +
    "\n\nUse this information to make a better guess each time." +

  "\n\n\nWINNING".colorize(:white) +
    "\n\nAll players who complete the game with a correct guess will be given their" +
    "elapsed time and the number of guesses they required to win." +
    "Players with impressive scores will be added to the Hi - Scores Archive!" +

  "\n\n\nEXITING THE GAME".colorize(:white) +
    "\n\nAt any time if you wish to exit the game, simply type (q)" +
    " and press enter. Winning the game also exits you automatically." +
    "\n\n\n"

end
