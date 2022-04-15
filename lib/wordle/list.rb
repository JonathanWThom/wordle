# frozen_string_literal: true

module Wordle
  class List
    def random
      #list.sample.downcase.strip
      "blank"
    end

    def by_hash(hash)
      word = list.detect do |word|
        Digest::SHA2.hexdigest(word.downcase.strip)[..5] == hash
      end

      raise Wordle::Error, "Invalid word identifier, are you sure you copied it correctly?" if word.nil?

      word
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
