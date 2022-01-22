# frozen_string_literal: true

module Wordle
  class List
    def random
      list.sample.downcase.strip
    end

    def invalid?(word)
      !list.include?(word)
    end

    private

    def list
      @_list ||= Wordle::SOURCE
    end
  end
end
