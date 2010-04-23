class Treadmill

  def speed
    return Limelight::Specs.producer.production.treadmill.speed
  end

  def incline
    return Limelight::Specs.producer.production.treadmill.incline
  end

end
