class ElapsedTime

  def start
    @now = Time.now
  end

  def get
    Time.now - @now
  end

end