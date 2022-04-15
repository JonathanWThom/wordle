# frozen_string_literal: true

module Wordle
  class GuessValidator
    def initialize(
      guess,
      list,
      difficult,
      must_include,
      must_match
    )
      @guess = guess
      @list = list
      @difficult = difficult
      @must_include = must_include
      @must_match = must_match
      @validated = false
    end

    def invalid?
      !error.nil?
    end

    def error
      validate if !@validated

      @error
    end

    private

    def validate
      validate_normal_mode
      validate_hard_mode if @difficult
      @validated = true
    end

    def validate_normal_mode
      if @guess.length != 5
        @error = "Guess must be 5 letters long"
      elsif @list.invalid?(@guess)
        @error = "Guess not in word list"
      end
    end

    def validate_hard_mode
      @must_include.each do |letter|
        if !@guess.include?(letter)
          @error = "Guess must include #{letter}"
          break
        end
      end

      @guess.each_char.with_index do |letter, i|
        match = @must_match[i]
        if match && match != letter
          @error = "#{(i + 1).ordinalize} letter must be #{match}"
          break
        end
      end
    end
  end
end
