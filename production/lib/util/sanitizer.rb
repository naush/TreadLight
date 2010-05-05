$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'constants'

module Sanitizer

  def self.sanitize_speed(speed, direction = :down)
    speed = speed.to_f
    return (direction == :down ? Constants::MIN_SPEED : Constants::LOW_SPEED) if speed < Constants::LOW_SPEED
    return Constants::MAX_SPEED if speed > Constants::MAX_SPEED
    return speed
  end

  def self.sanitize_incline(incline)
    incline = incline.to_f
    return Constants::MIN_INCLINE if incline < Constants::MIN_INCLINE
    return Constants::MAX_INCLINE if incline > Constants::MAX_INCLINE
    return incline
  end

end