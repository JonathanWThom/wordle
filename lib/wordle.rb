# frozen_string_literal: true

require "digest"
require "optparse"
require_relative "string"
require_relative "wordle/version"
require_relative "wordle/source"
require_relative "wordle/list"
require_relative "wordle/guess_validator"
require_relative "wordle/guess_analyzer"
require_relative "wordle/legend"
require_relative "wordle/game"

module Wordle
  class Error < StandardError; end
end
