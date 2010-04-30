require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Default Scene" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
  end

  it "should initialize to 0.0 for speed" do
    scene.speed?.should == "0.0"
  end

  it "should initialize to 0.0% for incline" do
    scene.incline?.should == "1.5%"
  end

end