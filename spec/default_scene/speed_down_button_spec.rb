require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Speed Down Button" do

  uses_limelight :scene => "default_scene", :hidden => true
  
  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    @timer = MockTimer.new(scene.find("elapsed_time_value"), scene.find("total_miles_value"), @speed_value)
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
    scene.timer = @timer
  end

  it "should descrease speed by 0.1 when the speed_down button is clicked" do
    speed_up_button = scene.find("speed_up_button")
    speed_down_button = scene.find("speed_down_button")
    click_helper(speed_up_button, 1)
    click_helper(speed_down_button, 1)
    scene.speed?.should == "0.0"
  end
  
  it "should not decrease speed if speed is at minimum=0.0" do
    speed_down_button = scene.find("speed_down_button")
    click_helper(speed_down_button, 1)
    scene.speed?.should == "0.0"
  end

  it "should set speed to 0.0 when speed is below 0.5" do
    speed_up_button = scene.find("speed_up_button")
    speed_down_button = scene.find("speed_down_button")
    click_helper(speed_up_button, 1)
    click_helper(speed_down_button, 1)
    scene.speed?.should == "0.0"
  end

end