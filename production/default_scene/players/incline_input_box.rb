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
    scene.incline = self.text
    self.text = scene.incline?
  end

end