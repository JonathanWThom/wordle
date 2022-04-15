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
    }

    SQUARE_OPTIONS = {
      MATCH => "🟩",
      INCLUDED => "🟨",
      MISS => "⬛️"
    }

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
      TEXT_OPTIONS[result]
    end

    def square_color(result)
      SQUARE_OPTIONS[result]
    end
  end
end
