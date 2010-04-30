require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Converter" do

  it "should convert seconds to hours" do
    Converter.to_hour(60*60).should == '01'
  end

  it "should convert seconds to minutes" do
    Converter.to_minute(60).should == '01'
  end

  it "should convert seconds to seconds" do
    Converter.to_second(1).should == '01'
  end

end