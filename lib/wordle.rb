# frozen_string_literal: true

require_relative "wordle/version"

module Wordle
  class Error < StandardError; end

  class Game
    def self.play
      new.play
    end

    def initialize
      @target_word = generate_word
    end

    def play
      winner = false
      attempts = 0

      puts "Guess: "

      while attempts < 6 && !winner
        guess = gets.chomp

        if guess.downcase.strip === @target_word
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
