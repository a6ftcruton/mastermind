class HiScores

  attr_reader :file

  # def save(to_file='hi_scores.csv')
  #   CSV.open(to_file, 'w') do |file|
  #     file << ['player','elapsed_time','number_of_guesses']
  #   end
  # end

  def save_scores(score)
    file.puts(score)
    file.close
  end

  def show_scores(target="hi_scores.txt")
    f = File.open(target, 'w+') do |f|
      f.write("i'm working!")
    end
  end
end
