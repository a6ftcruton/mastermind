require_relative 'message_printer'
require 'json'

  class HiScores
    attr_reader :file

    def self.hi_scores_data(game)
      [
        { player:            game.player       },
        { time:              game.elapsed_time },
        { number_of_guesses: game.guess_count  }
      ] .to_json
    end

    def self.write_hi_scores(game)
      file = './data/hi_scores.json'
      File.open(file, 'a') do |file|
        file.write( hi_scores_data(game) )
      end
    end

    def self.print_hi_scores
      read_file        = File.read('./data/hi_scores.json')
      parsed_scores    = JSON.parse([read_file].to_json)


      hi_score_time     = parsed_scores.sort_by { |hash| hash["time"].to_i }
      # hi_score_guesses  = parsed_scores.sort_by { |has| has["number_of_guesses"].to_i}
      puts "Here are the top 3 scores for fastest time: "
      puts hi_score_time
      # puts "Here are the top 3 scores for fewest guess: "
      # puts hi_score_guesses[0..3]


    end

  end


# hi_score_time     = parsed_scores.sort_by { |hash| hash["time"].to_i }
# hi_score_guesses  = parsed_scores.sort_by { |has| has["number_of_guesses"].to_i}
# puts "Here are the top 3 scores for fastest time: "
# puts hi_score_time[0..3]
# puts "Here are the top 3 scores for fewest guess: "
# puts hi_score_guesses[0..3]
