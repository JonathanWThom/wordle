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
      !list.include?(word)
    end

    private

    def list
      # fall back to api if this fails?
      @_list ||= File.readlines("/usr/share/dict/words").select do |word|
                   word.strip.length == @length
                 end.map { |w| w.downcase.strip } # sanitize class to standarize this?
    end
  end
end
