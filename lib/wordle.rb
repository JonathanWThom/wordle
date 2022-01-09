# frozen_string_literal: true

require_relative "string"
require_relative "wordle/version"
require_relative "wordle/guess_analyzer"
require_relative "wordle/game"

module Wordle
  class Error < StandardError; end
end
