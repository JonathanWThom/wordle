# frozen_string_literal: true

module Wordle
  class GuessValidator
    attr_reader :error

    def initialize(guess, list, difficult = false)
      @guess = guess
      @list = list
      @dificult = difficult
    end

    def invalid?
      !@error.nil?
    end

    def validate_normal_mode
      if @guess.length != 5
        @error = "Guess must be 5 letters long"
      elsif @list.invalid?(@guess)
        @error = "Guess not in word list"
      end
    end

    def validate_hard_mode(must_match, must_include)
      must_include.each do |letter|
        if !@guess.include?(letter)
          @error = "Guess must include #{letter}"
          break
        end
      end

      @guess.each_char.with_index do |letter, i|
        if must_match[i] == letter
          @error = "#{i + 1}.ordinalize letter must be #{letter}"
          break
        end
      end
    end
  end
end
