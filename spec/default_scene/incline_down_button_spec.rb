require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Incline Down Button" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
  end

  it "should decrease incline by 0.1% when the incline_down_button is clicked" do
    incline_up_button = scene.find("incline_up_button")
    incline_down_button = scene.find("incline_down_button")
    click_helper(incline_up_button, 1)
    click_helper(incline_down_button, 1)
    scene.incline?.should == '0.0%'
  end

  it "should not decrease incline if incline is at minimum=0.0%" do
    incline_down_button = scene.find("incline_down_button")
    click_helper(incline_down_button, 1)
    scene.incline?.should == '0.0%'
  end

end