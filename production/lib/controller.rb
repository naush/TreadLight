module Controller

  def speed_up
    current_speed = @meter.speed?.to_f
    current_speed += 0.1 if current_speed < 10.0
    @meter.speed = "#{current_speed}"
  end

  def speed_down
    current_speed = @meter.speed?.to_f
    current_speed -= 0.1 if current_speed > 0.0
    @meter.speed = "#{current_speed}"
  end
  
  def incline_up
    current_incline = @meter.incline?.chop.to_f
    current_incline += 0.1 if current_incline < 15.0
    @meter.incline = "#{current_incline}%"
  end

  def incline_down
    current_incline = @meter.incline?.chop.to_f
    current_incline -= 0.1 if current_incline > 0.0
    @meter.incline = "#{current_incline}%"
  end  

end