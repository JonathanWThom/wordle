# frozen_string_literal: true

module Wordle
  class ResultBuilder
    MATCH = :match
    INCLUDED = :included
    MISS = :miss

    TEXT_OPTIONS = {
      MATCH => :green,
      INCLUDED => :yellow,
      MISS => :gray
    }.freeze

    SQUARE_OPTIONS = {
      MATCH => "🟩",
      INCLUDED => "🟨",
      MISS => "⬛️"
    }.freeze

    CONTRAST_TEXT_OPTIONS = {
      MATCH => :orange,
      INCLUDED => :blue,
      MISS => :gray
    }.freeze

    CONTRAST_SQUARE_OPTIONS = {
      MATCH => "🟧",
      INCLUDED => "🟦",
      MISS => "⬛️"
    }.freeze

    def initialize(contrast = false)
      @contrast = contrast
    end

    def match?(result)
      result == MATCH
    end

    def included?(result)
      result == INCLUDED
    end

    def match
      MATCH
    end

    def included
      INCLUDED
    end

    def miss
      MISS
    end

    def text_color(result)
      return TEXT_OPTIONS[result] if !@contrast

      CONTRAST_TEXT_OPTIONS[result]
    end

    def square_color(result)
      return SQUARE_OPTIONS[result] if !@contrast

      CONTRAST_SQUARE_OPTIONS[result]
    end
  end
end
