require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Incline Up Button" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
  end

  150.times do |times|
    it "should increase incline by #{0.1 * times}% when the incline_up_button is clicked" do
      incline_up_button = scene.find("incline_up_button")
      click_helper(incline_up_button, times)
      scene.incline?.should == "#{0.1 * times}%"
    end
  end

  it "should not increase incline if incline is at maximum=15.0%" do
    incline_up_button = scene.find("incline_up_button")
    click_helper(incline_up_button, 151)
    scene.incline?.should == '15.0%'
  end

end