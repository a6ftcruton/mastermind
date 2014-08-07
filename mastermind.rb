Dir["./lib/*.rb"].each { |file| require file }
require 'json'

cli = CLI.new
printer = MessagePrinter.new
printer.greet_player
cli.run
