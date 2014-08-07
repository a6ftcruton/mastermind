gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_sequence_generator'

class SequenceGeneratorTest < Minitest::Test
  def test_it_returns_an_array
    sequence = SequenceGenerator.generate
    assert sequence.kind_of? Array
  end

  def test_it_contains_exactly_one_element
    skip
    sequence = SequenceGenerator.generate
    assert_equal 1, sequence.length
  end

  def test_it_contains_a_string
    sequence = SequenceGenerator.generate
    assert sequence.all? {|i| i.is_a? String}
  end

  def test_its_contents_can_be_changed
    skip
    sequence = SequenceGenerator.generate
    initial_value = sequence[0]
    sequence = SequenceGenerator.generate
    new_value = sequence[0]
    refute initial_value == new_value, "Calling generate twice does not produce unique values."
  end

  def test_it_holds_4_items
    sequence = SequenceGenerator.generate
    assert_equal 4, sequence.length
  end
end
