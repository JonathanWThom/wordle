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
      target_letters = @target_word.split("")
      guess_letters = @guess.split("")
      colored_letters = ""

      guess_letters.each_with_index do |letter, i|
        if letter == target_letters[i]
          colored_letters += letter.green
        elsif target_letters.include?(letter)
          colored_letters += letter.yellow
        else
          colored_letters += letter.gray
        end
      end

      colored_letters
    end
  end
end
