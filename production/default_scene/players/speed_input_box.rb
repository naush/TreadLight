module SpeedInputBox

  # def mouse_exited(event)
  #   scene.find('input_box_list').remove(self)
  # end

  # def key_typed(event)
  #   scene.find('speed_value').text = self.text
  #   if event.keyCode == 10
  #     # scene.find('input_box_list').remove(self)
  #   end
  # end

  def key_released(event)
    scene.find('speed_value').text = self.text
    if event.keyCode == 10
      update
    end
  end
  
  def update
    speed_value = self.text.to_f
    if (speed_value > 10.0)
      speed_value = 10.0
    elsif (speed_value < 0.0)
      speed_value = 0.0
    end
    scene.speed = speed_value
    self.text = speed_value
  end

end