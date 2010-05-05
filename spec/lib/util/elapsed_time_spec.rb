require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'elapsed_time'

describe ElapsedTime do
  before(:each) do
    @elapsed_time = ElapsedTime.new
    @now = Time.now
  end

  it "get elapsed start at zero" do
    Time.stub(:now).and_return(@now)
    @elapsed_time.start
    @elapsed_time.get.should == 0
  end

  it "should elapse 5 seconds" do
    Time.stub(:now).and_return(@now)
    @elapsed_time.start
    Time.stub(:now).and_return(@now + 5)
    @elapsed_time.get.should == 5
  end

end
