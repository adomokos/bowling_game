require_relative '../lib/bowling'

module Bowling
  describe Game do
    let(:game) { subject }
    it "scores 0 for all gutter rolls" do
      20.times do
        game.roll(0)
      end

      expect(game.score).to eq(0)
    end

    it "scores 20 for all one pins" do
      20.times do
        game.roll(1)
      end

      expect(game.score).to eq(20)
    end

    it "spare for first frame" do
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times do
        game.roll(0)
      end

      expect(game.score).to eq(16)
    end

    it "spare for first frame, double next pins" do
      game.roll(5)
      game.roll(5)
      game.roll(3)
      game.roll(2)
      16.times do
        game.roll(0)
      end

      expect(game.score).to eq(18)
    end

    it "calculates the score for the first strike" do
      game.roll(10)
      game.roll(3)
      game.roll(2)
      16.times do
        game.roll(0)
      end

      expect(game.score).to eq(20)
    end

    it "calculate perfect game" do
      12.times do
        game.roll(10)
      end

      expect(game.score).to eq(300)
    end
  end
end
