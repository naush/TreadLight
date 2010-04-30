require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Timer" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @elapsed_time_value = scene.find('elapsed_time_value')
    @total_miles_value = scene.find('total_miles_value')
    @speed_value = scene.find('speed_value')
    @timer = Timer.new(@elapsed_time_value, @total_miles_value, @speed_value)
  end

  it "should start timer and change the value of elapsed time value after 1 second" do
    @timer.start
    sleep(2.0)
    @timer.stop
    @elapsed_time_value.text.should == '00:00:01'
  end

  it "should continue to increment time after the timer's been stopped and started again" do
    @timer.start
    sleep(2.0)
    @timer.stop
    old_time = @elapsed_time_value.text.split(':')[-1]
    @timer.start
    sleep(2.0)
    @timer.stop
    new_time = @elapsed_time_value.text.split(':')[-1]
    old_time.to_i.should < new_time.to_i
  end

  it "should display one minute time correctly" do
    @timer.generate_time_script(60).should == '00:01:00'
  end

  it "should display one hour time correctly" do
    @timer.generate_time_script(60*60).should == '01:00:00'
  end

  it "should resest time before timer is overflow" do
    @timer.generate_time_script(60*60*100).should == '00:00:00'
  end

  it "should resest time when reset method is called on timer" do
    @timer.start
    sleep(2.0)
    @timer.stop
    @timer.reset
    @elapsed_time_value.text.should == '00:00:00'
  end

  it "should display one mile correctly" do
    @timer.generate_miles_script(0.0, 1).should == '01.00'
  end

  it "should reset 100 miles back to 0 mile" do
    @timer.generate_miles_script(0.0, 100).should == '00.00'
  end

end