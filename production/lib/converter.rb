module Converter

  def self.to_hour(seconds)
    hour = seconds / 3600
    return append_zero(hour)
  end

  def self.to_minute(seconds)
    minute = seconds / 60 % 60
    return append_zero(minute)
  end

  def self.to_second(seconds)
    second = seconds % 60
    return append_zero(second)
  end

  def self.append_zero(value)
    return value < 10 ? '0' + value.to_s : value.to_s
  end

end