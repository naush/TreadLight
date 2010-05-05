require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "Sanitizer" do

  it "should map key code 39 with speed_up" do
    KeyMap.method_name_of(39).should == 'speed_up'
  end

  it "should map key code 37 with speed_down" do
    KeyMap.method_name_of(37).should == 'speed_down'
  end

  it "should map key code 38 with speed_up" do
    KeyMap.method_name_of(38).should == 'incline_up'
  end

  it "should map key code 40 with speed_up" do
    KeyMap.method_name_of(40).should == 'incline_down'
  end

end