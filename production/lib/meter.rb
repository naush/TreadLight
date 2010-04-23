class Meter

  def initialize(treadmill, speed_value, incline_value)
    @treadmill = treadmill
    @speed_value = speed_value
    @incline_value = incline_value
  end

  def speed=(speed)
    @treadmill.speed = speed.to_f
    @speed_value.text = speed
  end

  def incline=(incline)
    @treadmill.incline = incline.to_f
    @incline_value.text = incline
  end

  def speed?
    return @speed_value.text
  end
  
  def incline?
    return @incline_value.text
  end

end