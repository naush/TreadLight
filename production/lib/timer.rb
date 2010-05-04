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
    @last_updated_time = 0
  end

  def start
    return if @timer_thread
    @last_updated_time = Time.now
    @is_running = true
    @timer_thread = Thread.new do
      while @is_running
        time_delta = Time.now - @last_updated_time
        @last_updated_time = Time.now
        @elapsed_time += time_delta
        @miles += Converter.to_miles_per_second(@speed_value.text.to_f) * time_delta
        update_elapsed_time_and_total_miles
        sleep(1.0)
      end
    end
  end

  def update_elapsed_time_and_total_miles
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

  def reset
    reset_time
    reset_distance
    update_props
  end

  def reset_time
    @last_udpated_time = Time.now
    @elapsed_time = 0
  end

  def reset_distance
    @miles = 0.0
  end

end