class BowlingGame
  def initialize
    @total = 0
    @frames = []
  end

  def roll(score)
    last = @frames.last
    if @frames.size == 10
      last << score
    elsif last && last.size < 2 && last[0] != 10
      last << score
    else
      @frames << [score]
    end
  end

  def score
    total_score = 0
    @frames.each_with_index do |frame, index|
      frame_score = frame.inject { |sum, n| sum + n }
      is_spare = frame_score == 10
      is_strike = frame[0] == 10
      if is_strike
        total_score += frame_score + next_two_scores(index)
      elsif is_spare 
        total_score += frame_score + next_score(index)
      else
        total_score += frame_score
      end
    end
    total_score
  end

  def next_score(index)
    frame = @frames[index + 1]
    frame[0]
  end

  def next_two_scores(index)
    if index == 9
      frame = @frames[index]
      frame[1] + frame[2]
    else
      frame = @frames[index + 1]
      if frame.size == 1
        frame[0] + @frames[index + 2][0]
      else
        frame[0] + frame[1]
      end
    end
  end
end
