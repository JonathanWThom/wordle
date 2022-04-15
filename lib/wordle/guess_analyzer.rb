# frozen_string_literal: true

module Wordle
  class GuessAnalyzer
    def initialize(target_word, guess, result_builder = ResultBuilder.new)
      @target_word = target_word
      @guess = guess
      @result_builder = result_builder
    end

    def match?
      @guess.downcase.strip == @target_word
    end

    def colors
      raw_results.each_with_index.map do |result, i|
        guess_letters[i].send(@result_builder.text_color(result))
      end.join("")
    end

    def squares
      raw_results.each_with_index.map do |result, i|
        @result_builder.square(result)
      end.join("")
    end

    def must_include(prev_must_include)
      raw_results.each_with_index do |result, i|
        if @result_builder.included?(result) && !prev_must_include.include?(guess_letters[i])
          prev_must_include << guess_letters[i]
        end
      end

      prev_must_include
    end

    def must_match(prev_must_match)
      raw_results.each_with_index do |result, i|
        if @result_builder.match?(result)
          prev_must_match[i] = guess_letters[i]
        end
      end

      prev_must_match
    end

    private

    def guess_letters
      @_guess_letters ||= @guess.chars
    end

    def raw_results
      @_raw_results ||= begin
        target_letters = @target_word.chars
        results = []

        guess_letters.each_with_index do |letter, i|
          if letter == target_letters[i]
            results[i] = @result_builder.match
            target_letters[i] = nil
          end
        end

        guess_letters.each_with_index do |letter, i|
          if results[i].nil?
            results[i] = if target_letters.include?(letter)
              @result_builder.included
            else
              @result_builder.miss
            end
          end
        end

        results
      end
    end
  end
end
