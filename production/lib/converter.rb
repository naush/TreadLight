module Converter

  def self.to_time_format(seconds)
    Time.at(seconds).gmtime.strftime('%R:%S')
  end

  def self.to_distance_format(miles)
    "%05.2f" % miles
  end

  def self.to_miles_per_second(miles_per_hour)
    miles_per_hour / 3600
  end

end