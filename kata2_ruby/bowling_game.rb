class BowlingGame
  def initialize
    @total = 0
    @frames = []
  end

  def roll(score)
    last = @frames.last
    if last && last.size < 2
      last << score
    else
      @frames << [score]
    end
  end

  def score
    total_score = 0
    is_spare = false
    @frames.each do |frame|
      frame_score = frame.inject { |sum, n| sum + n }
      total_score += is_spare ? frame[0] * 2 + frame[1] : frame_score
      is_spare = frame_score == 10
    end
    total_score
  end
end
