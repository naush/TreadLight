class Treadmill
  def speed
    return "%0.1f" % Limelight::Specs.producer.production.treadmill.speed
  end

  def incline
    return "%0.1f" % Limelight::Specs.producer.production.treadmill.incline
  end
end
