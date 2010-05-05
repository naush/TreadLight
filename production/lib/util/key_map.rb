module KeyMap

  def self.method_name_of(key_code)
    @map[key_code]
  end

  @map = {}
  @map[39] = 'speed_up'
  @map[37] = 'speed_down'
  @map[38] = 'incline_up'
  @map[40] = 'incline_down'

end