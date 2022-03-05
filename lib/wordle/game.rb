# frozen_string_literal: true

module Wordle
  class Game
    def self.play
      new.play
    end

    def initialize(options_reader = Options.new)
      @list = List.new
      @options = options_reader.read
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
        validator.validate_normal_mode
        validator.validate_hard_mode(must_include, must_match) if @options[:difficult]
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
  end
end
