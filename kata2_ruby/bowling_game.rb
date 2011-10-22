class BowlingGame
  def initialize
    @total = 0
    @frames = []
  end

  def roll(score)
    last = @frames.last
    if last && last.size < 2 && last[0] != 10
      last << score
    else
      @frames << [score]
    end
  end

  def score
    total_score = 0
    is_spare = false
    is_strike = false
    @frames.each do |frame|
      frame_score = frame.inject { |sum, n| sum + n }
      if is_strike
        total_score += frame_score * 2
      elsif is_spare 
        total_score += (frame[0] * 2)
        total_score += frame[1] if frame.size > 1
      else
        total_score += frame_score
      end
      is_spare = frame_score == 10
      is_strike = frame[0] == 10
    end
    total_score
  end
end
