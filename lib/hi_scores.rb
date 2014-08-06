require 'json'

class HiScores
  attr_reader :file

    def print_high_scores
      # parse scores and print top 10 to terminal
      # get contents of file in a way that can be passed to json.parse
      #WORKING:
      file               = File.read('./data/hi_scores.json')
      parsed_scores    = JSON.parse([file].to_json)
      print parsed_scores
    end
  end

test = HiScores.new
test.print_high_scores


      # File.open( filename, "r" ) do |f|
      #   JSON.load( f )
      # end

# hi_score_time     = parsed_scores.sort_by { |hash| hash["time"].to_i }
# hi_score_guesses  = parsed_scores.sort_by { |has| has["number_of_guesses"].to_i}
# puts "Here are the top 3 scores for fastest time: "
# puts hi_score_time[0..3]
# puts "Here are the top 3 scores for fewest guess: "
# puts hi_score_guesses[0..3]

#   def hi_scores
#     file = '../../hi_scores.json'
#     File.open(file, 'a') do |file|
#       # file.write(@player)
#       # file.write(@elapsed_time)
#       # file.write(@guess_count)
#       file.puts(hi_scores_info)
#     end
#   end
#
# def hi_scores_data
#   [
#     { player:            @player       },
#     { time:              @elapsed_time },
#     { number_of_guesses: @guess_count  }
#   ].to_json
# end
#
# def print_high_scores
#   # parse scores and print top 10 to terminal
#   parsed_scores     = JSON.parse('../../hi_scores.json')
#   hi_score_time     = parsed_scores.sort_by { |hash| hash["time"].to_i }
#   hi_score_guesses  = parsed_scores.sort_by { |has| has["number_of_guesses"].to_i}
#   puts "Here are the top 3 scores for fastest time: "
#   puts hi_score_time[0..3]
#   puts "Here are the top 3 scores for fewest guess: "
#   puts hi_score_guesses[0..3]
# end

# testing = TestOne.new
# testing.print_high_scores
