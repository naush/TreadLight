require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Converter" do

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

  it "should convert miles per hour to miles per second" do
    Converter.to_miles_per_second(1).should == 1/3600
  end

end