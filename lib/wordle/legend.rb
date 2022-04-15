# frozen_string_literal: true

module Wordle
  class Legend
    def self.print(*args)
      new(*args).print
    end

    def initialize(result_builder = ResultBuilder.new)
      @result_builder = result_builder
    end

    def print
      puts match_example
      puts included_example
      puts miss_example
      puts "\nRestart and add -i flag to target a specific word by hash, for example:"
      puts "$ wordle -i ed541a\n\n"
    end

    private

    def match_color
      @result_builder.match_text_color
    end

    def included_color
      @result_builder.included_text_color
    end

    def match_example
      "#{"w".send(match_color)}eary - The letter w is in the word and in the correct spot."
    end

    def included_example
      "p#{"i".send(included_color)}lls - The letter i is in the word but in the wrong spot."
    end

    def miss_example
      "vag#{"u".gray}e - The letter u is not in the word in any spot."
    end
  end
end
