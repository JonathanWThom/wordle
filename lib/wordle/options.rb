# frozen_string_literal: true

module Wordle
  class Options
    def read
      options = {}

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: wordle [options]"

        opts.on("-iIDENTIFIER", "--identifier=IDENTIFIER", "Pass word identifer to target a specific word that someone else has played. Identifier gets printed at the end of the game to share with a friend.") do |i|
          options[:identifier] = i
        end

        opts.on("-d", "--difficult", "Hard mode. Any revealed hints must be used in subsequent guesses.") do |d|
          options[:difficult] = d
        end

        opts.on("-c", "--contrast", "High contrast mode. Matched letters will be orange. Included letters will be blue.") do |c|
          options[:contrast] = c
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
