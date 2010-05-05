require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Speed Up Button" do

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

  it "should set speed to 0.5 when speed is below 0.5" do
    speed_up_button = scene.find("speed_up_button")
    click_helper(speed_up_button, 1)
    scene.speed?.should == "0.5"
  end

  it "should not increase speed if speed is at maximum=10.0" do
    speed_up_button = scene.find("speed_up_button")
    click_helper(speed_up_button, 96)
    speed_value = scene.find("speed_value")
    speed_value.text.should == '10.0'
    scene.speed?.should == '10.0'
  end

end