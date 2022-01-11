# frozen_string_literal: true

module Wordle
  class Game
    def self.play
      new.play
    end

    def initialize
      @list = List.new
      @target_word = generate_word
    end

    # print letters that have already been used?
    # compare to real words

    def play
      winner = false
      attempts = 0

      Legend.print
      puts "Guess a 5 letter word: "

      while attempts < 6 && !winner
        guess = gets.chomp

        validator = GuessValidator.new(guess, @list)
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
        puts "Winner!"
      else
        puts "Word was: #{@target_word}"
        puts "Better luck next time!"
      end
    end

    private

    def generate_word
      @list.random
    end
  end
end
