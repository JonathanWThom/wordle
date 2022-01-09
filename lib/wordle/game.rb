# frozen_string_literal: true

module Wordle
  class Game
    def self.play
      new.play
    end

    def initialize
      @target_word = generate_word
    end

    # print letters that have already been used?
    # compare to real words

    def play
      winner = false
      attempts = 0

      puts "Guess: "

      while attempts < 6 && !winner
        guess = gets.chomp

        validator = GuessValidator.new(guess)
        if validator.invalid?
          puts validator.error
          next
        end

        analyzer = GuessAnalyzer.new(@target_word, guess)
        puts analyzer.colors

        if analyzer.match?
          winner = true
          break
        end

        attempts += 1
      end

      if winner
        puts "winner!"
      else
        puts "better luck next time!"
      end
    end

    private

    def generate_word
      # maybe its own class
      "gorge"
    end
  end
end
