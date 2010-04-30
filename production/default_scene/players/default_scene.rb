$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'controller'

module DefaultScene

  include Controller

  attr_accessor :meter
  attr_accessor :timer

  def speed=(speed)
    if (speed == '0.0')
      stop_timer
    else
      start_timer
    end
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
      start_timer
      speed_up
    elsif (key_code == 37)
      speed_down
      if (find('speed_value').text == '0.0')
        stop_timer
      end
    elsif (key_code == 38)
      incline_up
    elsif (key_code == 40)
      incline_down
    end
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

end