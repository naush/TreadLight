class MockElapsedTime

  def start
  end

  def set(times)
    @times = times
  end

  def get
    return @times ? @times.pop : 0
  end

  def count
    @timers.length
  end

end