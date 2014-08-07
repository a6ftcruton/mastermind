gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/hi_scores'

class HiScoresTest < Minitest::Test
  def test_it_has_filename
    hiscores = HiScores.new('first-hi-scores.txt', 'a+')
    assert_equal hiscores.filename, 'first-hi-scores.txt'
  end

  def test_it_puts_text_into_file
    file = Minitest::Mock.new
    hiscores = HiScores.new(file, 'a+')
    file.expect(:open).with("filename", "w").and_yield(file)
    file.should_receive(:write).with("text")
  end
end
