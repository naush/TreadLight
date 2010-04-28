module InclineInputBox

  def key_released(event)
    scene.find('incline_value').text = self.text
    if event.keyCode == 10
      update
    end
  end

  def update
    incline_value = self.text.chop.to_f
    if (incline_value > 15.0)
      incline_value = 15.0
    elsif (incline_value < 0.0)
      incline_value = 0.0
    end
    scene.incline = "#{incline_value}%"
    self.text = "#{incline_value}%"
    # scene.load('default_scene')
  end

end