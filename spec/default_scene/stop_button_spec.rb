require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Stop Button" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
  end

  it "should only reset speed to 0.0 when the stop button is clicked" do
    stop_button = scene.find("stop_button")
    incline_up_button = scene.find("incline_up_button")
    click_helper(incline_up_button, 1)
    click_helper(stop_button, 1)
    scene.speed?.should == "0.0"
    scene.incline?.should == "0.1%"
  end

end