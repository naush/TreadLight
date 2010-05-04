$: << File.expand_path(File.dirname(__FILE__) + "/../production/lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../production")

require 'limelight/specs/spec_helper'
require 'rubygems'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../production")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

class LimelightFixture
  
  class MockEvent
    attr_accessor :keyCode
    def initialize(keyCode)
      @keyCode = keyCode
    end
    def getKeyCode
      return @keyCode
    end
  end

  def initialize
    Limelight::Main.initializeTestContext
    Limelight::Specs.producer = Limelight::Producer.new($PRODUCTION_PATH)
    Limelight::Specs.producer.production.test_run = true
    Limelight::Specs.producer.open
    @speed_input_box = scene.find('speed_input_box')
    @incline_input_box = scene.find('incline_input_box')
    @elapsed_time_value = scene.find('elapsed_time_value')
    @total_miles_value = scene.find('total_miles_value')
  end

  def shutdown
    unless Limelight::Specs.producer.nil?
      Limelight::Specs.producer.theater.stages.each do |stage|
        frame = stage.instance_variable_get("@frame")
        frame.close if frame
      end
    end
    return true
  end

  def scene
    stage = Limelight::Specs.producer.theater.stages[0]
    return stage.current_scene
  end

  def click(prop_id)
    scene.find(prop_id).mouse_clicked(nil)
  end

  def type_in_input_box(key, box)
    if (box == :speed)
      input_box = @speed_input_box
    elsif (box == :incline)
      input_box = @incline_input_box
    end
    if (key =~ /\d/)
      input_box.text = key
    elsif (key == 'enter')
      key = 10
    else
      key = key.to_i + 48
    end
    input_box.key_released(MockEvent.new(key.to_i))
  end

  def type_in_speed_input_box(key)
    type_in_input_box(key, :speed)
  end

  def type_in_incline_input_box(key)
    type_in_input_box(key, :incline)
  end

  def press_right
    scene.key_pressed(MockEvent.new(39))
  end

  def press_left
    scene.key_pressed(MockEvent.new(37))
  end

  def press_up
    scene.key_pressed(MockEvent.new(38))
  end

  def press_down
    scene.key_pressed(MockEvent.new(40))
  end

  def text(id)
    scene.find(id).text
  end
  
  def given_speed_is(speed)
    scene.speed = speed
  end
  
  def given_incline_is(incline)
    scene.incline = incline
  end

  def given_elapsed_time_is_seconds(seconds)
    scene.set_time(seconds.to_f)
  end

  def when_hours_have_elapsed(hour)
    scene.set_time(hour.to_f * 60 * 60)
  end

end

