module QuizPassagesHelper
  def minutes_format(time)
    format('%02d', (time / 60).floor)
  end

  def seconds_format(time)
    format('%02d', time % 60)
  end
end
