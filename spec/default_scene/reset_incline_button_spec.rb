require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Reset Incline Button" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
  end

  it "should reset incline to 0.0% when reset_incline_button is clicked" do
    incline_up_button = scene.find("incline_up_button")
    reset_incline_button = scene.find("reset_incline_button")
    click_helper(incline_up_button, 1)
    click_helper(reset_incline_button, 1)
    scene.incline?.should == '0.0%'
  end

end