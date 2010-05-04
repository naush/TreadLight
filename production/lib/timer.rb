$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'converter'

class Timer

  attr_accessor :miles
  attr_accessor :elapsed_time

  NINTY_NINE_HOURS = 86400

  def initialize(elapsed_time_value, total_miles_value, speed_value)
    @elapsed_time_value = elapsed_time_value
    @total_miles_value = total_miles_value
    @speed_value = speed_value
    @elapsed_time = 0.0
    @miles = 0
  end

  def start
    return if @timer_thread
    @start_time = Time.now - @elapsed_time
    @is_running = true
    @timer_thread = Thread.new do
      while @is_running
        @elapsed_time = Time.now - @start_time
        update_elapsed_time_and_total_miles
        sleep(1.0)
      end
    end
  end

  def update_elapsed_time_and_total_miles
    @miles += speed_in_miles_per_second
    reset_time if (@elapsed_time >= NINTY_NINE_HOURS)    
    reset_distance if (@miles >= 100)
    update_props
  end

  def update_props
    @elapsed_time_value.text = Converter.to_time_format(@elapsed_time)
    @total_miles_value.text = Converter.to_distance_format(@miles)
  end

  def stop
    if (@timer_thread)
      @is_running = false
      @timer_thread.join
      @timer_thread = nil
    end
  end

  def speed_in_miles_per_second
    @speed_value.text.to_f / 3600
  end

  def reset
    reset_time
    reset_distance
    update_props
  end

  def reset_time
    @start_time = Time.now
    @elapsed_time = 0
  end

  def reset_distance
    @miles = 0.0
  end

end