# frozen_string_literal: true

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
      result_map = {
        match: :green,
        included: :yellow,
        miss: :gray
      }

      raw_results.each_with_index.map do |result, i|
        guess_letters[i].send(result_map[result])
      end.join("")
    end

    def squares
      result_map = {
        match: "🟩",
        included: "🟨",
        miss: "⬛️"
      }

      raw_results.each_with_index.map do |result, i|
        result_map[result]
      end.join("")
    end

    def must_include(prev_must_include)
      raw_results.each_with_index do |result, i|
        if result == :included && !prev_must_include.include?(guess_letters[i])
          prev_must_include << guess_letters[i]
        end
      end

      prev_must_include
    end

    def must_match(prev_must_match)
      raw_results.each_with_index do |result, i|
        if result == :match
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
            results[i] = :match
            target_letters[i] = nil
          end
        end

        guess_letters.each_with_index do |letter, i|
          if results[i].nil?
            results[i] = if target_letters.include?(letter)
              :included
            else
              :miss
            end
          end
        end

        results
      end
    end
  end
end
