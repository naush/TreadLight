class MockEvent
  attr_accessor :keyCode
  def initialize(keyCode)
    @keyCode = keyCode
  end
  def getKeyCode
    return @keyCode
  end
end