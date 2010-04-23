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

    def initialize(key_code)
      @key_code = key_code
    end
  
    def getKeyCode
      return @key_code
    end

  end
  
  def initialize
    Limelight::Main.initializeTestContext
    Limelight::Specs.producer = Limelight::Producer.new($PRODUCTION_PATH)
    Limelight::Specs.producer.open
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

end

