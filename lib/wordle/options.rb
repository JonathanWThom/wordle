# frozen_string_literal: true

module Wordle
  class Options
    def read
      options = {}

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: wordle [options]"

        opts.on("-iIDENTIFIER", "--identifier=IDENTIFIER", "Pass word identifer to target a specific word that someone else has played. Identifier gets printed at the end of the game to share.") do |i|
          options[:identifier] = i
        end

        opts.on("-d", "--difficult", "Hard mode. Any revealed hints must be used in subsequent guesses.") do |d|
          options[:difficult] = d
        end
      end

      begin
        parser.parse!
      rescue OptionParser::InvalidOption
        puts "Option not recognized"
      end

      options
    end
  end
end
