# frozen_string_literal: true

module Wordle
  class Game
    def self.play(*args)
      new(*args).play
    end

    def initialize(options_reader = Options.new)
      @list = List.new
      @options = options_reader.read
      @target_word = generate_word
      @result_builder = ResultBuilder.new(@options[:contrast])
      @history = History.new
    end

    def play
      winner = false

      Legend.print(@result_builder)
      puts "Guess a 5 letter word: "
      guesses = []
      must_include = []
      must_match = Array.new(5)

      while guesses.length < 6 && !winner
        guess = gets.chomp

        validator = GuessValidator.new(
          guess,
          @list,
          @options[:difficult],
          must_include,
          must_match
        )
        if validator.invalid?
          puts validator.error
          next
        end

        analyzer = GuessAnalyzer.new(
          @target_word,
          guess,
          @result_builder
        )
        puts analyzer.colors
        guesses << analyzer.squares
        if @options[:difficult]
          must_include = analyzer.must_include(must_include)
          must_match = analyzer.must_match(must_match)
        end

        if analyzer.match?
          winner = true
          break
        end
      end

      hash = Digest::SHA2.hexdigest(@target_word)[..5]
      if winner
        @history.update(guesses.length)
        puts "\nWordle Gem #{hash} #{guesses.length}/6\n\n"
      else
        @history.update
        puts "\nWord was: #{@target_word}\n"
        puts "\nWordle Gem #{hash} X/6*\n\n"
      end

      puts guesses
      puts @history.show
    end

    private

    def generate_word
      if @options[:identifier]
        @list.by_hash(@options[:identifier])
      else
        @list.random
      end
    end
  end
end
