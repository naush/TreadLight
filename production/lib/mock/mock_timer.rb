$: << File.expand_path(File.dirname(__FILE__) + "/lib")
# require 'converter'
require 'timer'

class MockTimer < Timer

  def start_thread(&block)
    @run_block = block
  end

  def run_task
    @run_block.call if @is_running
  end

end