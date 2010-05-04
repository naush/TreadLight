require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Converter" do

  uses_limelight :scene => "default_scene", :hidden => true

  it "should format one second time correctly" do
    Converter.to_time_format(1).should == "00:00:01"
  end

  it "should format one minute time correctly" do
    Converter.to_time_format(60).should == "00:01:00"
  end

  it "should format one hour time correctly" do
    Converter.to_time_format(60*60).should == "01:00:00"
  end
  
  it "should format one mile correctly" do
    Converter.to_distance_format(1).should == "01.00"
  end

  # it "should display one hour time correctly" do
  #   @timer.elapsed_time = 60*60
  #   @timer.update_elapsed_time_and_total_miles
  #   @elapsed_time_value.text.should == '01:00:00'
  # end
  # 
  # it "should resest time before timer is overflow" do
  #   @timer.elapsed_time = 100*60*60
  #   @timer.update_elapsed_time_and_total_miles
  #   @elapsed_time_value.text.should == '00:00:00'
  # end
  # 
  # it "should display one mile correctly" do
  #   @timer.miles = 1
  #   @timer.update_elapsed_time_and_total_miles
  #   @total_miles_value.text.should == '01.00'
  # end
  # 
  # it "should display ten miles correctly" do
  #   @timer.miles = 10
  #   @timer.update_elapsed_time_and_total_miles
  #   @total_miles_value.text.should == '10.00'
  # end
  # 
  # it "should reset 100 miles back to 0 mile" do
  #   @timer.miles = 100
  #   @timer.update_elapsed_time_and_total_miles
  #   @total_miles_value.text.should == '00.00'
  # end

end