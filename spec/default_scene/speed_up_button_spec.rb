require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Speed Up Button" do

  uses_limelight :scene => "default_scene", :hidden => true
  
  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
  end

  100.times do |times|
    it "should increase speed by #{0.1 * times} when the speed_up_button is clicked" do
      speed_up_button = scene.find("speed_up_button")
      click_helper(speed_up_button, times)
      speed_value = scene.find("speed_value")
      speed_value.text.should == "#{0.1 * times}"
      scene.speed?.should == "#{0.1 * times}"
    end
  end
  
  it "should not increase speed if speed is at maximum=10.0" do
    speed_up_button = scene.find("speed_up_button")
    click_helper(speed_up_button, 101)
    speed_value = scene.find("speed_value")
    speed_value.text.should == '10.0'
    scene.speed?.should == '10.0'
  end

end