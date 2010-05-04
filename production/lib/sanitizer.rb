module Sanitizer

  MAX_SPEED = 10.0
  MIN_SPEED = 0.0
  LOW_SPEED = 0.5
  MAX_INCLINE = 15.0
  MIN_INCLINE = 0.0

  def self.sanitize_speed(speed, direction = :down)
    speed = speed.to_f
    return (direction == :down ? MIN_SPEED : LOW_SPEED) if speed < LOW_SPEED
    return MAX_SPEED if speed > MAX_SPEED
    return speed
  end

  def self.sanitize_incline(incline)
    incline = incline.to_f
    return MIN_INCLINE if incline < MIN_INCLINE
    return MAX_INCLINE if incline > MAX_INCLINE
    return incline
  end

end