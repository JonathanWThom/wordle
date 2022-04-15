# frozen_string_literal: true

module Wordle
  class ResultBuilder
    MATCH = :match
    INCLUDED = :included
    MISS = :miss

    DEFAULT_OPTIONS = {
      MATCH => {text: :green, square: "🟩"},
      INCLUDED => {text: :yellow, square: "🟨"},
      MISS => {text: :gray, square: "⬛️"}
    }.freeze

    CONTRAST_OPTIONS = {
      MATCH => {text: :orange, square: "🟧"},
      INCLUDED => {text: :blue, square: "🟦"},
      MISS => {text: :gray, square: "⬛️"}
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

    def match_text_color
      options[match][:text]
    end

    def included_text_color
      options[included][:text]
    end

    def text_color(result)
      options[result][:text]
    end

    def square_color(result)
      options[result][:square]
    end

    private

    def options
      return DEFAULT_OPTIONS if !@contrast
      @_options ||= CONTRAST_OPTIONS
    end
  end
end
