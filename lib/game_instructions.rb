class GameInstructions
  attr_reader :instructions

# def initialize( instructions = File.open('../data/instructions.txt', 'r') )
#     @instructions = instructions
#   end

  def self.load_instructions
    puts @instructions.center(100, '*')
  end

  @instructions =
  "
  OBJECT
    The computer will select a secrete combinaton of colored pegs.
    Your job is to guess that combination in as few tries as possible.

  HOW TO PLAY
    Each of the peg positions can be any of 4 colors:
      red, green, blue, or yellow.
    Any color can be used more than once or not at all.
      e.g.
          r  r  r  r
          y  b  g  b
    Each time you submit a guess, you will receive feedback about the following:
      -how many colors you have matched in the correct location
      -how many correct colors you have chosen but put in the wrong location
    Use this information to make a better guess each time.

  WINNING
    All players who complete the game with a correct guess will be given their
    elapsed time and the number of guesses they required to win.
    Players with impressive scores will be added to the Hi - Scores Archive!

  EXITING THE GAME
    At any time if you wish to exit the game,
    simply type (q) and press enter.
    Winning the game also exits you automatically."
end