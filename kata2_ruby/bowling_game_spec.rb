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

  it "should double next score of next when a spare is thrown" do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    17.times { @game.roll(0) }
    @game.score.should == 16
  end

  it "should double score of next two throws when a strike is thrown" do
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    16.times { @game.roll(0) }
    @game.score.should == 26
  end

  it "should double the score of a strike following a spare" do
    @game.roll(5)
    @game.roll(5)
    @game.roll(10)
    16.times { @game.roll(0) }
    @game.score.should == 30
  end

  it "should triple the score of a strike followed by two more" do
    3.times { @game.roll(10) }
    14.times { @game.roll(0) }
    @game.score.should == 60
  end

  it "should score 300 for perfect game" do
    12.times { @game.roll(10) }
    @game.score.should == 300
  end
end
