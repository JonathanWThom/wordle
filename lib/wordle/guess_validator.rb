# frozen_string_literal: true
module Wordle
  class GuessValidator
    attr_reader :error

    def initialize(guess)
      @guess = guess
    end

    def invalid?
      if @guess.length != 5
        @error = "Guess must be 5 letters long"
        return true
      end

      false
    end
  end
end
