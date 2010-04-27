module Controller

  MAX_SPEED = 10.0
  MIN_SPEED = 0.0
  MAX_INCLINE = 15.0
  MIN_INCLINE = 0.0
  STEP = 0.1

  def update_meter(current_value, step, boundary_value)
    if step == 0.1
      current_value += step if current_value < boundary_value
    elsif step == -0.1
      current_value += step if current_value > boundary_value
    end
    return current_value
  end

  def speed_up
    @meter.speed = "#{update_meter(@meter.speed?.to_f, STEP, MAX_SPEED)}"
  end

  def speed_down
    @meter.speed = "#{update_meter(@meter.speed?.to_f, -STEP, MIN_SPEED)}"
  end

  def incline_up
    @meter.incline = "#{update_meter(@meter.incline?.to_f, STEP,MAX_INCLINE)}%"
  end

  def incline_down
    @meter.incline = "#{update_meter(@meter.incline?.to_f, -STEP, MIN_INCLINE)}%"
  end
  
  def reset_incline
    @meter.incline = "0.0%"
  end

end