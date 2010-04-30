module InclineInputBox

  def mouse_clicked(event)
    scene.find('incline_value').text = ''
    self.text = ''
  end

  def key_released(event)
    if event.keyCode == 10
      update
    else
      scene.find('incline_value').text = self.text
    end
  end

  def focus_lost(event)
    update
  end

  def update
    self.text += '%' if self.text[-1] != '%'
    incline_value = self.text.chop.to_f
    if (incline_value > 15.0)
      incline_value = 15.0
    elsif (incline_value < 0.0)
      incline_value = 0.0
    end
    scene.incline = "%0.1f" % incline_value + '%'
    self.text = "%0.1f" % incline_value + '%'
  end

end