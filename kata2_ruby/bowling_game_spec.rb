require 'rspec'
require './bowling_game'

describe BowlingGame do
  before(:each) do
    @game = BowlingGame.new
  end

  it "score should be 0 for gutter game" do
    20.times { @game.roll(0) }
    @game.score.should == 0
  end

  it "should score 20 when all ones are thrown" do
    20.times { @game.roll(1) }
    @game.score.should == 20
  end
end
