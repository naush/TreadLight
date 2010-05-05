$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'converter'
require 'timer'

class MockTimer < Timer

  def start
    @start = true
  end

	def update_elapsed_time_and_total_miles(time_delta)
		calculate_elapsed_time_and_total_miles(time_delta) if @start
	end

  def stop
    @start = false
    return true
  end

end