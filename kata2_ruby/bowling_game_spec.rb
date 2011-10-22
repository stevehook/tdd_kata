require 'rspec'
require './bowling_game'

describe BowlingGame do
  context "Gutter game" do
    before(:each) do
      @game = BowlingGame.new
    end

    it "score should be zero" do
      20.times { @game.roll(0) }
      @game.score.should == 0
    end
  end
end
