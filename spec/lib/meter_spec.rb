require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Meter" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    @meter = Meter.new(@treadmill, @speed_value, @incline_value)
  end

  it "should set speed on treadmill and prop" do
    @meter.speed = '1.0'
    @treadmill.speed.should == 1.0
    @speed_value.text.should == '1.0'
  end

  it "should set incline on treadmill and prop" do
    @meter.incline = '1.0%'
    @treadmill.incline.should == 1.0
    @incline_value.text.should == '1.0%'
  end
  
end