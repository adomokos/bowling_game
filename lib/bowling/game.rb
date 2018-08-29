require 'pp'

module Bowling
  class Game

    def initialize
      @rolls = []
    end

    def roll(pins)
      @rolls.push(pins)
    end

    def score
      idx = 0
      score = 0

      10.times do |frame|
        if strike?(@rolls[idx])
          score += 10
          score += @rolls[idx+1] + @rolls[idx+2]
          idx += 1
        elsif spare?([@rolls[idx], @rolls[idx+1]])
          score += 10
          score += @rolls[idx+2]
          idx += 2
        else
          score += @rolls[idx] + @rolls[idx+1]
          idx += 2
        end

      end

      score
    end

    private

    def spare?(frame)
      (frame.first + frame.last) == 10
    end

    def strike?(roll)
      roll == 10
    end

  end
end
