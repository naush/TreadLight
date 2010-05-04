require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Input Box" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @speed_value = scene.find("speed_value")
    @incline_value = scene.find("incline_value")
    @treadmill = MockTreadmill.new
    @timer = MockTimer.new(scene.find("elapsed_time_value"), scene.find("total_miles_value"), @speed_value)
    scene.meter = Meter.new(@treadmill, @speed_value, @incline_value)
    @event = mock('event')
    @event.should_receive(:keyCode).and_return(10)
    scene.timer = @timer
  end

  it "should set speed when speed_input_box is set" do
    @speed_input_box = scene.find('speed_input_box')
    @speed_input_box.text = '1.0'
    @speed_input_box.key_released(@event)
    scene.speed?.should == '1.0'
  end

  it "should set incline when incline_input_box is set" do
    @incline_input_box = scene.find('incline_input_box')
    @incline_input_box.text = '1.0%'
    @incline_input_box.key_released(@event)
    scene.incline?.should == '1.0%'
  end
  
  it "should set max speed when speed_input_box is set with a number larger than max speed" do
    @speed_input_box = scene.find('speed_input_box')
    @speed_input_box.text = '10.1'
    @speed_input_box.key_released(@event)
    scene.speed?.should == '10.0'
  end

  it "should set min speed when speed_input_box is set with a number less than min speed" do
    @speed_input_box = scene.find('speed_input_box')
    @speed_input_box.text = '-0.1'
    @speed_input_box.key_released(@event)
    scene.speed?.should == '0.0'
  end

  it "should set max incline when incline_input_box is set with a number larger than max incline" do
    @incline_input_box = scene.find('incline_input_box')
    @incline_input_box.text = '15.1%'
    @incline_input_box.key_released(@event)
    scene.incline?.should == '15.0%'
  end

  it "should set min incline when incline_input_box is set with a number less than min incline" do
    @incline_input_box = scene.find('incline_input_box')
    @incline_input_box.text = '-0.1%'
    @incline_input_box.key_released(@event)
    scene.incline?.should == '0.0%'
  end

  it "should set min incline when incline_input_box is not set with a number" do
    @incline_input_box = scene.find('incline_input_box')
    @incline_input_box.text = 'asdf'
    @incline_input_box.key_released(@event)
    scene.incline?.should == '0.0%'
  end

end