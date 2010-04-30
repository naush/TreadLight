require 'converter'

class Timer
  
  include Converter

  attr_accessor :miles

  def initialize(elapsed_time_value, total_miles_value, speed_value)
    @elapsed_time_value = elapsed_time_value
    @total_miles_value = total_miles_value
    @speed_value = speed_value
    @seconds = 0
    @miles = 0
  end

  def start
    if @timer_thread.nil?
      @timer_thread = Thread.new do
        while true
          @elapsed_time_value.text = generate_time_script(@seconds)
          @total_miles_value.text = generate_miles_script(@speed_value.text.to_f, @miles)
          @seconds += 1
          sleep(1.0)
        end
      end
    end
  end

  def generate_miles_script(mph, miles)
    miles += mph / 3600
    ret = "%0.2f" % miles
    @miles = miles
    if (miles < 10)
      return '0' + ret
    elsif (miles < 100)
      return ret
    else
      @miles = 0
      return '00.00'
    end
  end

  def generate_time_script(seconds)
    if (seconds == 100*60*60)
      seconds = 0
      return '00:00:00'
    else
      return Converter.to_hour(seconds) + ':' + Converter.to_minute(seconds) + ':' + Converter.to_second(seconds)
    end
  end

  def stop
    Thread.kill(@timer_thread) if !@timer_thread.nil?
    @timer_thread = nil
  end

  def reset
    @seconds = 0
    @miles = 0
    @elapsed_time_value.text = '00:00:00'
    @total_miles_value.text = '00.00'
  end

end