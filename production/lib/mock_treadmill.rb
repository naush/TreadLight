class MockTreadmill
  attr_accessor :speed, :incline
  def initialize
    @speed = 0.0
    @incline = 1.5
  end
  def stop
  end
end