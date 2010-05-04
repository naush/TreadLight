module SpeedDownButton
  def mouse_clicked(event)
    speed_value = scene.find('speed_value')
    if (speed_value.text.to_f <= 0.5)
      scene.speed = '0.0'
    end
    scene.speed_down
  end
end