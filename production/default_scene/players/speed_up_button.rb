module SpeedUpButton
  def mouse_clicked(event)
    scene.start_timer
    if (scene.speed?.to_f < 0.5)
      scene.speed = '0.5'
    else
      scene.speed_up
    end
  end
end