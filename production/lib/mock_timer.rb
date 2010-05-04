class MockTimer

  attr_accessor :miles
  attr_accessor :elapsed_time

  def initialize(elapsed_time_value, total_miles_value, speed_value)
    @elapsed_time_value = elapsed_time_value
    @total_miles_value = total_miles_value
    @speed_value = speed_value
    @miles = 0.0
    @elapsed_time = 0.0
  end

  def start
    @start = true
  end

  def update_elapsed_time_and_total_miles
    if (@start == true)
      @elapsed_time_value.text = generate_time_script(@elapsed_time)
      @total_miles_value.text = generate_miles_script(@speed_value.text.to_f / 3600)
    end
  end

  def generate_time_script(seconds)
    if (seconds < 86400)
      script = Time.at(seconds).gmtime.strftime('%R:%S')
    else
      script = "00:00:00"
    end

    if (seconds >= 86400)    
      @start_time = Time.now
      @elapsed_time = 0
    end

    return script
  end

  def generate_miles_script(mps)
    @miles += mps * @elapsed_time
    if (@miles < 100)
      script = (@miles < 10 ? "0%0.2f" : "%0.2f") % @miles
      puts script
    else
      script = "00.00"
      @miles = 0.0
    end
    return script
  end

  def stop
    @start = false
    return true
  end

  def reset
    @elapsed_time_value.text = '00:00:00'
    @total_miles_value.text = '00.00'    
  end

end