class Treadmill

  def speed
    return "#{(Limelight::Specs.producer.production.treadmill.speed * 10).round.to_f / 10}"
  end

  def incline
    return "#{(Limelight::Specs.producer.production.treadmill.incline * 10).round.to_f / 10}"
  end

end
