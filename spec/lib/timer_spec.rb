require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Timer" do

  uses_limelight :scene => "default_scene", :hidden => true

  before (:each) do
    @elapsed_time_value = scene.find('elapsed_time_value')
    @total_miles_value = scene.find('total_miles_value')
    @speed_value = scene.find('speed_value')
    @elapsed_time = MockElapsedTime.new
    @mock_timer = MockTimer.new(@elapsed_time_value, @total_miles_value, @speed_value, @elapsed_time)
    @timer = Timer.new(@elapsed_time_value, @total_miles_value, @speed_value, @elapsed_time)
  end

  it "should display one minute after one minute time is elapsed" do
    @elapsed_time.set([60, 0])
    @mock_timer.start
    @mock_timer.run_task
    @mock_timer.stop
    @elapsed_time_value.text.should == '00:01:00'
  end

  it "should display one hour after one hour time is elapsed" do
    @elapsed_time.set([60*60, 0])
    @mock_timer.start
    @mock_timer.run_task
    @mock_timer.stop
    @elapsed_time_value.text.should == '01:00:00'
  end

  it "should display one minute time on prop correctly" do
    @timer.update_elapsed_time_and_total_miles(60)
    @timer.update_props
    @elapsed_time_value.text.should == '00:01:00'
  end

  it "should display one mile on prop correctly" do
    @speed_value.text = '10.0'
    @timer.update_elapsed_time_and_total_miles(60*6)
    @timer.update_props
    @total_miles_value.text.should == '01.00'
  end

end