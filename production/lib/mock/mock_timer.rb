$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'converter'
require 'timer'

class MockTimer < Timer

  def start
    @start = true
  end

  def update_elapsed_time_and_total_miles
    if (@start == true)
      reset_time if (@elapsed_time >= NINTY_NINE_HOURS)    
      reset_distance if (@miles >= 100)
      update_props
    end
  end

  def update_props
    @elapsed_time_value.text = Converter.to_time_format(@elapsed_time)
    @total_miles_value.text = Converter.to_distance_format(@speed_value.text.to_f * @elapsed_time / 3600)
  end

  def stop
    @start = false
    return true
  end

end