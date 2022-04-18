# frozen_string_literal: true

require "json"

module Wordle
  class History
    HISTFILE = "#{Dir.home}/.wordle"

    def initialize
      # create file if doesn't exist
    end

    def show
      puts "STATISTICS"
      puts [played, win_percentage, current_streak, max_streak].join(", ")
      puts "Guess Distribution"
      puts guess_distribution
    end

    def delete
    end

    private

    def raw_histfile
      @_raw_histfile ||= JSON.parse(File.read(HISTFILE))
    end

    def played
      "Played: #{raw_play_count}"
    end

    def raw_play_count
      @_raw_play_count ||= raw_histfile["played"]
    end

    def win_percentage
      percent = (win_count / raw_play_count * 100).round(0)

      "Win %: #{percent}"
    end

    def current_streak
      "Current Streak: #{raw_histfile["streak"]}"
    end

    def max_streak
      "Max Streak: #{raw_histfile["max_streak"]}"
    end

    def guess_distribution
      (1..6).map do |key|
        frequency = raw_histfile[key.to_s] / win_count
        bar_count = (frequency * 100).ceil
        if frequency.zero?
          "0"
        else
          "#{"|" * bar_count} #{raw_histfile[key.to_s]}"
        end
      end
    end

    def win_count
      @_win_count ||= win_count = ["1", "2", "3", "4", "5", "6"].reduce(0) do |sum, key|
        sum += raw_histfile[key] # cache this?
      end.to_f
    end
  end
end
