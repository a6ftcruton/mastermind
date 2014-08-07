gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_checker'

class GuessCheckerTest < Minitest::Test
  def test_guess_matches_sequence
    guess = "rg".downcase.chomp.split(//)
    sequence = ["r", "g"]
    p guess
    assert_equal guess, sequence
  end

  def test_first_guess_letter_matches_first_sequence_letter
    guess = "rg".downcase.chomp.split(//)
    sequence = ["r", "b"]
    assert_equal guess[0], sequence[0]
  end

  def test_second_guess_letter_does_not_match_second_sequence_letter
    guess = "rg".downcase.chomp.split(//)
    sequence = ["r", "b"]
    refute_equal guess[1], sequence[1]
  end

  def test_find_any_matches_in_four_item_array
    guess = "rrbb".downcase.chomp.split(//)
    sequence = ["r", "g", "b", "y"]
    comparison = (0..3).select {|index| guess[index] == sequence[index]}
    assert_equal comparison, [0, 2]
  end

  def test_find_any_matches_in_four_item_array
    guess = "rgby".downcase.chomp.split(//)
    sequence = ["r", "g", "b", "y"]
    comparison = (0..3).select {|index| guess[index] == sequence[index]}
    assert_equal comparison, [0, 1, 2, 3]
  end

  def test_it_prints_number_of_matches
    guess = "rgby".downcase.chomp.split(//)
    sequence = ["r", "g", "b", "y"]
    matched_items = (0..3).select {|index| guess[index] == sequence[index]}
    feedback = "You correctly matched #{matched_items.length} letters."
    assert_equal feedback, "You correctly matched 4 letters."
  end

  def test_it_identifies_a_correct_letter_at_wrong_index
    guess = "ry".downcase.chomp.split(//)
    sequence = ["g", "r"]
    assert sequence.include? guess[0]
  end

  def test_it_counts_number_of_correct_letters_at_wrong_index
    guess = "rgby".downcase.chomp.split(//)
    sequence = ["g", "r", "y", "b"]
    if sequence.include? guess[]
    assert sequence.include? guess[0]
  end

end
