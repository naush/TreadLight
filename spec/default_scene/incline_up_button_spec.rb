require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Incline Up Button" do

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

  27.times do |times|
    it "should increase incline by #{1.5 + 0.5 * times}% when the incline_up_button is clicked" do
      incline_up_button = scene.find("incline_up_button")
      click_helper(incline_up_button, times)
      scene.incline?.should == "#{1.5 + 0.5 * times}%"
    end
  end

  it "should not increase incline if incline is at maximum=15.0%" do
    incline_up_button = scene.find("incline_up_button")
    click_helper(incline_up_button, 31)
    scene.incline?.should == '15.0%'
  end

end