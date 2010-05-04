require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Sanitizer" do
  
  it "should set speed to 0 if speed is less than 0.5 and decreasing" do
    Sanitizer.sanitize_speed(0.1, :down).should == 0
  end

  it "should set speed to 0.5 if speed is less than 0.5 and increasing" do
    Sanitizer.sanitize_speed(0.1, :up).should == 0.5
  end

  it "should set speed to 0 if speed is less than 0" do
    Sanitizer.sanitize_speed(-0.1).should == 0
  end

  it "should set speed to 10 if speed is larger than 10" do
    Sanitizer.sanitize_speed(11).should == 10
  end
  
  it "should set speed to 0 if speed is not numeric" do
    Sanitizer.sanitize_speed('a').should == 0
  end

  it "should set speed to 0 if speed is a special character" do
    Sanitizer.sanitize_speed('$').should == 0
  end
  
  it "should return given speed if given speed is valid" do
    Sanitizer.sanitize_speed(0.5).should == 0.5
  end

  it "should set incline to 0 if incline is not numeric" do
    Sanitizer.sanitize_incline('a').should == 0
  end

  it "should set incline to 0 if incline is less than 0" do
    Sanitizer.sanitize_incline(-1).should == 0
  end

  it "should set incline to 15 if incline is larger than 15" do
    Sanitizer.sanitize_incline(16).should == 15
  end

  it "should return given incline if given incline is valid" do
    Sanitizer.sanitize_incline(15).should == 15
  end

end