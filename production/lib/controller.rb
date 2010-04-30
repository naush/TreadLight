module Controller

  MAX_SPEED = 10.0
  MIN_SPEED = 0.0
  MAX_INCLINE = 15.0
  MIN_INCLINE = 0.0
  SPEED_STEP = 0.1
  INCLINE_STEP = 0.5

  def update_meter(current_value, step, boundary_value)
    if valid_update?(current_value, step, boundary_value)
      current_value += step
    end
    return current_value
  end
  
  def valid_update?(current_value, step, boundary_value)
    return (step > 0 && current_value + step <= boundary_value) ||
           (step < 0 && current_value + step >= boundary_value)
  end

  def speed_up
    @meter.speed = update_meter(@meter.speed?.to_f, SPEED_STEP, MAX_SPEED).to_s
  end

  def speed_down
    @meter.speed = update_meter(@meter.speed?.to_f, -SPEED_STEP, MIN_SPEED).to_s
  end

  def incline_up
    @meter.incline = update_meter(@meter.incline?.to_f, INCLINE_STEP, MAX_INCLINE).to_s + '%'
  end

  def incline_down
    @meter.incline = update_meter(@meter.incline?.to_f, -INCLINE_STEP, MIN_INCLINE).to_s + '%'
  end

  def reset_incline
    @meter.incline = "1.5%"
  end

end