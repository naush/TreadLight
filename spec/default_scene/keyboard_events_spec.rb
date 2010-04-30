require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Keyboard Events" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    @timer = Timer.new(scene.find("elapsed_time_value"), scene.find("total_miles_value"), @speed_value)
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
    scene.timer = @timer
  end

  it "should increase speed by 0.1 if the right arrow-key is pressed 1 times" do
    right_arrow_event = mock("event")
    right_arrow_event.should_receive(:getKeyCode).and_return(39)
    scene.key_pressed(right_arrow_event)
    scene.speed?.should == "0.1"
  end

  it "should decrease speed by 0.1 if the left arrow-key is pressed 1 times" do
    right_arrow_event = mock("event")
    left_arrow_event = mock("event")
    right_arrow_event.should_receive(:getKeyCode).and_return(39)
    left_arrow_event.should_receive(:getKeyCode).and_return(37)
    scene.key_pressed(right_arrow_event)
    scene.key_pressed(left_arrow_event)
    scene.speed?.should == "0.0"
  end

  it "should increase incline by 0.5% if the up arrow-key is pressed 1 times" do
    up_arrow_event = mock("event")
    up_arrow_event.should_receive(:getKeyCode).and_return(38)
    scene.key_pressed(up_arrow_event)
    scene.incline?.should == "2.0%"
  end
  
  it "should decrease incline by 0.5% if the down arrow-key is pressed 1 times" do
    down_arrow_event = mock("event")
    down_arrow_event.should_receive(:getKeyCode).and_return(40)
    scene.key_pressed(down_arrow_event)
    scene.incline?.should == "1.0%"
  end

end