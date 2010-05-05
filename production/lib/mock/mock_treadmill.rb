class MockTreadmill
  attr_accessor :speed, :incline, :stopped, :shutdown

  def initialize
    @speed = 0.0
    @incline = 1.5
  end

  def stop
    @stopped = true
  end

  def shutdown
    @shutdown = true
  end
end