class MockEvent
  attr_accessor :keyCode

  def initialize(key_code)
    @keyCode = key_code
  end

  def getKeyCode
    return @keyCode
  end
end