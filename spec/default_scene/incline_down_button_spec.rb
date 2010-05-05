require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Incline Down Button" do

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

  it "should decrease incline by 0.1% when the incline_down_button is clicked" do
    incline_down_button = scene.find("incline_down_button")
    click_helper(incline_down_button, 1)
    scene.incline?.should == '1.0%'
  end

  it "should not decrease incline if incline is at minimum=0.0%" do
    incline_down_button = scene.find("incline_down_button")
    click_helper(incline_down_button, 4)
    scene.incline?.should == '0.0%'
  end

end