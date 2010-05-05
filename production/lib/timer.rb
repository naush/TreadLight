$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'converter'
require 'constants'

class Timer

  attr_accessor :time

  def initialize(elapsed_time_value, total_miles_value, speed_value, time)
    @elapsed_time_value = elapsed_time_value
    @total_miles_value = total_miles_value
    @speed_value = speed_value
    @elapsed_time = 0.0
    @miles = 0
    @time = time
    @is_running = false
  end

  def start
    return if @is_running
    @time.start
    @last_updated_time = @time.get
    @is_running = true
    start_thread do
      time_delta = calculate_time_delta
      update_elapsed_time_and_total_miles(time_delta)
      update_props
    end
  end

  def start_thread(&block)
    Thread.new do
      while @is_running
        yield
        sleep(1.0)
      end
    end
  end

  def calculate_time_delta
    now = @time.get
    time_delta = now - @last_updated_time
    @last_updated_time = now
    return time_delta
  end

  def update_elapsed_time_and_total_miles(time_delta)
    calculate_elapsed_time_and_total_miles(time_delta)
  end

  def calculate_elapsed_time_and_total_miles(time_delta)
    @elapsed_time += time_delta
    @miles += Converter.to_miles_per_second(@speed_value.text.to_f) * time_delta
    reset_time if (@elapsed_time >= Constants::NINTY_NINE_HOURS)
    reset_distance if (@miles >= Constants::MAX_DISTANCE)
  end

  def update_props
    @elapsed_time_value.text = Converter.to_time_format(@elapsed_time)
    @total_miles_value.text = Converter.to_distance_format(@miles)
  end

  def stop
    @is_running = false
    @timer_thread.join if @timer_thread
  end

  def reset
    reset_time
    reset_distance
    update_props
  end

  def time=(times)
    @time.set(times)
  end

  def reset_time
    @last_udpated_time = @time.get
    @elapsed_time = 0
  end

  def reset_distance
    @miles = 0.0
  end

end