require 'rubygems'
require 'spec'
require 'limelight/specs/spec_helper'

$: << File.expand_path(File.dirname(__FILE__) + "/../production/lib/")
$: << File.expand_path(File.dirname(__FILE__) + "/../production/lib/mock")
require 'mock_treadmill'
require 'mock_timer'
require 'meter'
require 'timer'
require 'converter'
require 'sanitizer'
require 'key_map'

# Set the Gem home to the frozen gems
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../production/")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

def click_helper(button, n)
  n.times { button.mouse_clicked(nil) }
end
