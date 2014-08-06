Dir["./lib/*.rb"].each { |file| require file }
require 'json'

cli = CLI.new
cli.run
