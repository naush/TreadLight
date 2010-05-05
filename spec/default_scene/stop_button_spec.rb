require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Stop Button" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @elapsed_time_value = scene.find("elapsed_time_value")
    @total_miles_value = scene.find("total_miles_value")
    @treadmill = MockTreadmill.new
    @elapsed_time = ElapsedTime.new
    @timer = MockTimer.new(@elapsed_time_value, @total_miles_value, @speed_value, @elapsed_time)
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
    scene.timer = @timer
  end

  it "should only reset speed to 0.0 when the stop button is clicked" do
    stop_button = scene.find("stop_button")
    click_helper(stop_button, 1)
    scene.speed?.should == "0.0"
    scene.incline?.should == "1.5%"
  end

end