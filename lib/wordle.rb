# frozen_string_literal: true

require "digest"
require "optparse"
require_relative "integer"
require_relative "string"
require_relative "wordle/game"
require_relative "wordle/guess_analyzer"
require_relative "wordle/guess_validator"
require_relative "wordle/history"
require_relative "wordle/legend"
require_relative "wordle/list"
require_relative "wordle/options"
require_relative "wordle/result_builder"
require_relative "wordle/source"
require_relative "wordle/version"

module Wordle
  class Error < StandardError; end
end
