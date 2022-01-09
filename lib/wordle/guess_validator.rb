# frozen_string_literal: true

module Wordle
  class GuessValidator
    attr_reader :error

    def initialize(guess, list)
      @guess = guess
      @list = list
    end

    def invalid?
      if @guess.length != 5
        @error = "Guess must be 5 letters long"
        return true
      elsif @list.invalid?(@guess)
        @error = "Guess must be a real word"
        return true
      end

      false
    end
  end
end
