gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_loop'

class GameLoopTest < Minitest::Test

def test_it_greets_the_user
  skip
  game = Game.new("Joe")
  assert_equal "Welcome to MASTERMIND!", game.greet_player
end

def test_it_gives_the_user_options
  skip
  game = Game.new("Joe")
  assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", game.options
end

# def test_it_stores_game_sequence_from_game_sequence_generator_class
#   game = Game.new("Joe")
#   assert game.run.store_sequence
# end


end # end class
