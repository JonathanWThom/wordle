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
      raw_colors.each_with_index.map do |color, i|
        guess_letters[i].send(color)
      end.join("")
    end

    def squares
      color_map = {
        green: "🟩",
        yellow: "🟨",
        gray: "⬛️"
      }

      raw_colors.each_with_index.map do |color, i|
        color_map[color]
      end.join("")
    end

    private

    def guess_letters
      @_guess_letters = @guess.chars
    end

    def raw_colors
      @_raw_colors ||= begin
        target_letters = @target_word.chars
        colors = []

        guess_letters.each_with_index do |letter, i|
          if letter == target_letters[i]
            colors[i] = :green
            target_letters[i] = nil
          end
        end

        guess_letters.each_with_index do |letter, i|
          if colors[i].nil?
            colors[i] = if target_letters.include?(letter)
              :yellow
            else
              :gray
            end
          end
        end

        colors
      end
    end
  end
end
