class BowlingGame
  def initialize
    @total = 0
  end

  def roll(pins)
    @total += pins
  end

  def score
    @total
  end
end
