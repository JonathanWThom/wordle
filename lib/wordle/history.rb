# frozen_string_literal: true

require "json"

module Wordle
  class History
    HISTFILE = "#{Dir.home}/.wordle"

    def initialize
      # create if doesn't exist

      File.read(HISTFILE)
    rescue Errno::ENOENT
      File.write(HISTFILE, default_history)
    end

    def show
      puts "STATISTICS"
      puts [played, win_percentage, current_streak, max_streak].join(", ")
      puts "\nGuess Distribution"
      puts guess_distribution
    end

    def delete
    end

    def update(guess_count = nil)
      history = raw_histfile
      history["played"] += 1

      if guess_count
        history["streak"] += 1
        if history["streak"] > history["max_streak"] # guard for emptiness of max streak
          history["max_streak"] = history["streak"]
        end
      else
        history["streak"] = 0
      end

      File.write(HISTFILE, history.to_json)
    end

    private

    def raw_histfile
      JSON.parse(File.read(HISTFILE))
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
        if win_count.zero? || frequency.zero?
          "#{key}: 0"
        else
          bar_count = (frequency * 100).ceil
          "#{key}: #{"|" * bar_count} #{raw_histfile[key.to_s]}"
        end
      end
    end

    def win_count
      @_win_count ||= win_count = ["1", "2", "3", "4", "5", "6"].reduce(0) do |sum, key|
        sum += raw_histfile[key] # cache this?
      end.to_f
    end

    def default_history
      {
        :played => 0,
        :streak => 0,
        :max_streak => 0,
        "0" => 0,
        "1" => 0,
        "2" => 0,
        "3" => 0,
        "4" => 0,
        "5" => 0,
        "6" => 0
      }.to_json
    end
  end
end
