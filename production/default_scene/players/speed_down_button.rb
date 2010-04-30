module SpeedDownButton
  def mouse_clicked(event)
    scene.speed_down
    if (scene.find('speed_value').text == '0.0')
      scene.stop_timer
    end
  end
end