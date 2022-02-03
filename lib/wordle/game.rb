# frozen_string_literal: true

module Wordle
  class Game
    def self.play
      new.play
    end

    def initialize
      @list = List.new
      @options = read_options
      @target_word = generate_word
    end

    def play
      winner = false

      Legend.print
      puts "Guess a 5 letter word: "
      guesses = []

      while guesses.length < 6 && !winner
        guess = gets.chomp

        validator = GuessValidator.new(guess, @list)
        if validator.invalid?
          puts validator.error
          next
        end

        analyzer = GuessAnalyzer.new(@target_word, guess)
        puts analyzer.colors
        guesses << analyzer.squares


        if analyzer.match?
          winner = true
          break
        end
      end

      hash = Digest::SHA2.hexdigest(@target_word)[..5]
      if winner
        puts "\nWordle Gem #{hash} #{guesses.length}/6\n\n"
      else
        puts "\nWord was: #{@target_word}\n"
        puts "\nWordle Gem #{hash} X/6*\n\n"
      end

      puts guesses
    end

    private

    def generate_word
      if @options[:identifier]
        @list.by_hash(@options[:identifier])
      else
        @list.random
      end
    end

    def read_options
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: wordle [options]"

        opts.on("-iIDENTIFIER", "--identifier=IDENTIFIER", "Pass word identifer to target a specific word that someone else has played. Identifier gets printed at the end of the game to share.") do |i|
          options[:identifier] = i
        end
      end.parse!

      options
    end
  end
end
