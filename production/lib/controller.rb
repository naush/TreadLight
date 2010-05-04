$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'constants'

module Controller

  def speed=(speed)
    speed_float = speed.to_f
    speed == '0.0' ? stop_timer : start_timer
    @meter.speed = Sanitizer.sanitize_speed(speed)
  end

  def speed?
    return @meter.speed?
  end

  def incline=(incline)
    incline_value = incline.chop.to_f
    @meter.incline = "%0.1f%" % Sanitizer.sanitize_incline(incline_value)
  end

  def incline?
    return @meter.incline?
  end

  def speed_up
    start_timer
    new_speed = @meter.speed?.to_f + Constants::SPEED_STEP
    @meter.speed = Sanitizer.sanitize_speed(new_speed, :up)
  end

  def speed_down
    new_speed = Sanitizer.sanitize_speed(@meter.speed?.to_f - Constants::SPEED_STEP, :down)
    stop_timer if new_speed <= 0.0
    @meter.speed = new_speed
  end

  def incline_up
    @meter.incline = Sanitizer.sanitize_incline(@meter.incline?.to_f + Constants::INCLINE_STEP).to_s + '%'
  end

  def incline_down
    @meter.incline = Sanitizer.sanitize_incline(@meter.incline?.to_f - Constants::INCLINE_STEP).to_s + '%'
  end

  def reset_incline
    @meter.incline = "1.5%"
  end

  def start_timer
    @timer.start
  end

  def stop_timer
    @timer.stop
  end

  def reset_timer
    @timer.reset
  end

  def time=(seconds)
    @timer.elapsed_time = seconds
    @timer.update_elapsed_time_and_total_miles
  end

end