module Production
  attr_reader :treadmill
  attr_accessor :test_run

  def production_opening
    $: << File.expand_path(File.dirname(__FILE__) + "/lib")
    $: << File.expand_path(File.dirname(__FILE__) + "/lib/mock")
    $: << File.expand_path(File.dirname(__FILE__) + "/lib/extern")
    $: << File.expand_path(File.dirname(__FILE__) + "/lib/util")
    require 'mock_treadmill'
    require 'mock_timer'
    require 'mock_elapsed_time'
    require 'meter'
    require 'timer'
    require 'ifit.jar'
    require 'elapsed_time'
  end

  def production_opened
    @default_scene = theater["default"].current_scene
    @speed_value = @default_scene.find("speed_value")
    @incline_value = @default_scene.find("incline_value")
    @elapsed_time_value = @default_scene.find("elapsed_time_value")
    @total_miles_value = @default_scene.find("total_miles_value")
    if (test_run)
      @treadmill = MockTreadmill.new
      @timer = MockTimer.new(@elapsed_time_value, @total_miles_value, @speed_value, MockElapsedTime.new)
    else
      @treadmill = Java::ifit::Treadmill.new
      @timer = Timer.new(@elapsed_time_value, @total_miles_value, @speed_value, ElapsedTime.new)
    end
    @meter = Meter.new(@treadmill, @speed_value, @incline_value)
    @default_scene.meter = @meter
    @default_scene.timer = @timer
  end

  def production_closing
    @treadmill.shutdown if @treadmill
  end

end