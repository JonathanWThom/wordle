# frozen_string_literal: true

require_relative "../string"

module Wordle
  class GuessAnalyzer
    def initialize(target_word, guess)
      @target_word = target_word
      @guess = guess
    end

    def match?
      @guess.downcase.strip == @target_word
    end

    def colors
      target_letters = @target_word.chars
      guess_letters = @guess.chars
      colored_letters = ""

      guess_letters.each_with_index do |letter, i|
        colored_letters += if letter == target_letters[i]
          letter.green
        elsif target_letters.include?(letter)
          letter.yellow
        else
          letter.gray
        end
      end

      colored_letters
    end
  end
end
