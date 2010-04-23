$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'controller'

module DefaultScene
  
  include Controller

  def meter=(meter)
    @meter = meter
  end

  def speed=(speed)
    @meter.speed = speed
  end

  def speed?
    return @meter.speed?
  end

  def incline=(incline)
    @meter.incline = incline
  end

  def incline?
    return @meter.incline?
  end

  def key_pressed(event)
    key_code = event.getKeyCode
    if (key_code == 39)
      speed_up
    elsif (key_code == 37)
      speed_down
    elsif (key_code == 38)
      incline_up
    elsif (key_code == 40)
      incline_down
    end
  end

end