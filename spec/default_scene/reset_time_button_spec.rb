require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Reset Time Button" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    @timer = MockTimer.new(scene.find("elapsed_time_value"), scene.find("total_miles_value"), @speed_value)
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
    scene.timer = @timer
  end

  it "should reset time and miles to 0 when the reset button is clicked" do
    start_button = scene.find("start_button")
    reset_time_button = scene.find("reset_time_button")
    click_helper(start_button, 1)
    scene.time = 60
    click_helper(reset_time_button, 1)
    scene.find("elapsed_time_value").text.should == "00:00:00"
    scene.find("total_miles_value").text.should == "00.00"
  end

end