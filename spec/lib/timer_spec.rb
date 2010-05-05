require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Timer" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @elapsed_time_value = scene.find('elapsed_time_value')
    @total_miles_value = scene.find('total_miles_value')
    @speed_value = scene.find('speed_value')
    @timer = Timer.new(@elapsed_time_value, @total_miles_value, @speed_value)
  end

  it "should display one minute time correctly" do
    @timer.update_elapsed_time_and_total_miles(60)
    @timer.update_props
    @elapsed_time_value.text.should == '00:01:00'
  end

  it "should display one hour time correctly" do
    @timer.update_elapsed_time_and_total_miles(60*60)
    @timer.update_props
    @elapsed_time_value.text.should == '01:00:00'
  end

  it "should resest time before timer is overflow" do
    @timer.update_elapsed_time_and_total_miles(100*60*60)
    @timer.update_props
    @elapsed_time_value.text.should == '00:00:00'
  end

  it "should display one mile correctly" do
    @timer.miles = 1
    @timer.update_elapsed_time_and_total_miles(1)
    @timer.update_props
    @total_miles_value.text.should == '01.00'
  end

  it "should display ten miles correctly" do
    @timer.miles = 10
    @timer.update_elapsed_time_and_total_miles(1)
    @timer.update_props
    @total_miles_value.text.should == '10.00'
  end

  it "should reset 100 miles back to 0 mile" do
    @timer.miles = 100
    @timer.update_elapsed_time_and_total_miles(1)
    @timer.update_props
    @total_miles_value.text.should == '00.00'
  end

end