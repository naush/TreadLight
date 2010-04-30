require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Start Button" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    @timer = Timer.new(scene.find("elapsed_time_value"), scene.find("total_miles_value"), @speed_value)
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
    scene.timer = @timer
  end

  it "should only reset speed to 1.0 when the start button is clicked on" do
    start_button = scene.find("start_button")
    click_helper(start_button, 1)
    scene.speed?.should == '1.0'
    scene.incline?.should == '1.5%'
  end

end