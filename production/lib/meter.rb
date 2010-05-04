class Meter

  def initialize(treadmill, speed_value, incline_value)
    @treadmill = treadmill
    @speed_value = speed_value
    @incline_value = incline_value
    @treadmill.speed = @speed_value.text.to_f
    @treadmill.incline = @incline_value.text.to_f
  end

  def speed=(speed)
    @treadmill.speed = speed.to_f
    @speed_value.text = speed
    @treadmill.stop if speed == '0.0'
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