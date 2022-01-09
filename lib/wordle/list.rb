# frozen_string_literal: true

module Wordle
  class List
    def initialize(length = 5)
      @length = length
    end

    def random
      list.sample.downcase.strip
    end

    def invalid?(word)
      false
    end

    private

    def list
      @_list ||= begin
        yes = File.readlines("/usr/share/dict/words").select do |word|
          word.strip.length == @length
        end
      end
    end
  end
end
