require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Reset Incline Button" do

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

  it "should reset incline to 1.5% when reset_incline_button is clicked" do
    incline_up_button = scene.find("incline_up_button")
    reset_incline_button = scene.find("reset_incline_button")
    click_helper(incline_up_button, 1)
    click_helper(reset_incline_button, 1)
    scene.incline?.should == '1.5%'
  end

end